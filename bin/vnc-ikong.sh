#!/usr/bin/env bash
tunnel_pid() {
	lsof -t -i4TCP:5901 -sTCP:LISTEN
}

tunnel() {
	ssh -fNL 5901:127.0.0.1:5900 ikong
}

openvnc_established() {
	lsof -i4TCP:5901 -sTCP:ESTABLISHED >/dev/null
}

openvnc() {
	open vnc://127.0.0.1:5901/
}

main() {

	local pid interval=${1:-3}

	pid=$(tunnel_pid)
	if [[ $? -ne 0 ]]; then
		if ! tunnel; then
			echo 'Open SSH Tunnel failed' >&2
			return 1
		fi
		pid=$(tunnel_pid)
	fi
	# shellcheck disable=SC2064
	trap "kill $pid" EXIT

	if openvnc_established; then
		echo 'VNC is already ESTABLISHED' >&2
		return 1
	fi

	openvnc
	sleep "$interval"
	while openvnc_established; do
		sleep "$interval"
	done
}

main "$@"
