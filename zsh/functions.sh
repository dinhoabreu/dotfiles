latest() {
	# shellcheck disable=SC2012,SC2086
	ls -t $1/* | head -n 1
}

toss() {
	for filename; do
		if [[ -e $HOME/.Trash/$filename ]]; then
			mv "${filename}" "${HOME}/.Trash/${filename}$(date +%Y%m%d%H%M%S)"
		else
			mv "${filename}" "${HOME}/.Trash"
		fi
	done
}

variables() {
	comm -23 <(declare) <(declare -f) ;
}

fingerprints() {

	local file="$1" opts=(-l) proto key id

	if ssh-keygen --help -h 2>&1 | grep -q fingerprint_hash; then
		opts+=(-E md5)
	fi
	opts+=(-f /dev/stdin)
	while read -r proto key id; do

		if [[ -n $proto && ${proto###} = "$proto" ]]; then
			printf "%s: " "$id"
			ssh-keygen "${opts[@]}" <<<"$proto $key"
		fi
	done <"$file" | cut -d ' ' -f 1-3
}

