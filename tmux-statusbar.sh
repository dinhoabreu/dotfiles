#!/usr/bin/env bash

tmux_get() {
	tmux show -v -g "$1"
}

cmd_exists() {
	hash "$1" 2>/dev/null
}

join_by() {

	local d=$1

	shift
	echo -n "$1"
	shift
	printf '%s' "${@/#/$d}"
}

main() {

	local status_right info=()

	cd "$( dirname "${BASH_SOURCE[0]}" )" || return 1

	if cmd_exists osascript; then
		status_right="$(tmux_get status-right)"
		if [[ $TMUX_STATUSBAR_INBOX -eq 1 ]]; then
			info+=("#[fg=colour42]#(osascript $PWD/applescripts/inbox.js)")
		fi
		if [[ $TMUX_STATUSBAR_TUNES -eq 1 ]]; then
			info+=("#(osascript $PWD/applescripts/tunes.js) ")
		fi
		tmux set -g status-right "$(join_by ' • ' "${info[@]}") $status_right"
	fi
}

main
