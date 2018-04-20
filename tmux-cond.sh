#!/usr/bin/env bash

tmux_version_gte() {

	local re='^([0-9]+)\.([0-9]+)' version_ref=$1
	local name version
	local tmux_major=0 tmux_minor=0
	local ref_major=0 ref_minor=1

	# shellcheck disable=SC2034
	read -r name version
	if [[ $version =~ $re ]]; then
		tmux_major=${BASH_REMATCH[1]}
		tmux_minor=${BASH_REMATCH[2]}
	fi
	if [[ $version_ref =~ $re ]]; then
		ref_major=${BASH_REMATCH[1]}
		ref_minor=${BASH_REMATCH[2]}
	fi
	(((100 * tmux_major + tmux_minor) >= (100 * ref_major + ref_minor)))
}

## Add vi selections
enable-vi-selections() {

  local r24e_exists=1 pbcopy_exists=1
  if cmd-exists reattach-to-user-namespace; then
    r24e_exists=0
  fi
  if cmd-exists pbcopy; then
    pbcopy_exists=0
  fi
	if tmux -V | tmux_version_gte 2.6; then
    tmux bind -T copy-mode-vi 'v' send -X begin-selection
    tmux bind -T copy-mode-vi 'y' send -X copy-selection
    if [[ $r24e_exists -eq 0 && $pbcopy_exists -eq 0 ]]; then
      tmux bind -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
      tmux unbind -T copy-mode-vi Enter
      tmux bind -T copy-mode-vi Enter send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
    fi
  else
    tmux bind -t vi-copy 'v' begin-selection
    tmux bind -t vi-copy 'y' copy-selection
    if [[ $r24e_exists -eq 0 && $pbcopy_exists -eq 0 ]]; then
      tmux bind -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"
      tmux unbind -t vi-copy Enter
      tmux bind -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
    fi
  fi
}

## Enable mouse control (clickable windows, panes, resizable panes)
enable-mouse() {
	if tmux -V | tmux_version_gte 2.1; then
		tmux set -g mouse on
	else
		tmux set -g mode-mouse on
		tmux set -g mouse-select-window on
		tmux set -g mouse-select-pane on
		tmux set -g mouse-resize-pane on
	fi
}

## Enable copy integration with clipboard
enable-copy-clipboard() {

  local r24e_exists=1 pbcopy_exists=1
  if cmd-exists reattach-to-user-namespace; then
    r24e_exists=0
  fi
  if cmd-exists pbcopy; then
    pbcopy_exists=0
  fi
	if tmux -V | tmux_version_gte 2.6; then
    if [[ $r24e_exists -eq 0 && $pbcopy_exists -eq 0 ]]; then
      tmux bind -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel 'reattach-to-user-namespace pbcopy'
    fi
  else
    if [[ $r24e_exists -eq 0 && $pbcopy_exists -eq 0 ]]; then
      tmux bind -t vi-copy MouseDragEnd1Pane copy-pipe "reattach-to-user-namespace pbcopy"
    fi
  fi
}

cmd-exists() {
  command -v "$1" >/dev/null
}

main() {
  enable-vi-selections
  enable-mouse
  enable-copy-clipboard
}

main
