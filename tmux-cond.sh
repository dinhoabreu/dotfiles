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
	if tmux -V | tmux_version_gte 2.6; then
    tmux set bind-key -Tcopy-mode-vi 'v' send -X begin-selection
    tmux set bind-key -Tcopy-mode-vi 'y' send -X copy-selection
  else
    tmux set bind -t vi-copy 'v' begin-selection
    tmux set bind -t vi-copy 'y' copy-selection
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

main() {
  enable-vi-selections
  enable-mouse
}

main
