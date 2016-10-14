#!/usr/bin/env bash

tmux_get() {
	tmux show -v -g "$1"
}

cmd_exists() {
	hash "$1" 2>/dev/null
}

main() {
	
	local status_right

	cd "$( dirname "${BASH_SOURCE[0]}" )" || return 1
	
	if cmd_exists osascript; then
		status_right="$(tmux_get status-right)"
    tmux set -g status-right "#[fg=colour42]#(osascript $PWD/applescripts/inbox.js) • #(osascript $PWD/applescripts/tunes.js) $status_right"
	fi
}

main
