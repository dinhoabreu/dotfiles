#!/usr/bin/env bash

# shellcheck disable=SC2034
tmux_version_gte() {

	local name version aux vref=$1
	local tmux_major tmux_minor
	local ref_major ref_minor

	read -r name version
	IFS='.' read -r tmux_major tmux_minor aux <<<"$version"
	IFS='.' read -r ref_major ref_minor aux <<<"$vref"
	(((100 * tmux_major + tmux_minor) >= (100 * ref_major + ref_minor)))
}

main() {
	## Enable mouse control (clickable windows, panes, resizable panes)
	if tmux -V | tmux_version_gte 2.1; then
		tmux set -g mouse on
	else
		tmux set -g mouse-select-window on
		tmux set -g mouse-select-pane on
		tmux set -g mouse-resize-pane on
	fi
}

main
