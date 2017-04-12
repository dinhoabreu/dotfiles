#!/usr/bin/env bash
if [[ -f $HOME/.profile ]]; then
	# shellcheck disable=SC1090
	. "$HOME/.profile"
fi

if [[ -f $HOME/.bashrc ]]; then
	# shellcheck disable=SC1090
	. "$HOME/.bashrc"
fi

# Test if "brew" exists
if [[ -f $(command -v brew) ]] && [[ -f $(brew --prefix)/etc/bash_completion ]]; then
	# shellcheck disable=SC1090
	. "$(brew --prefix)/etc/bash_completion"
fi

# Bash-it
if [[ -d $HOME/.bash_it ]] && [[ -f $HOME/dotfiles/bash_it ]]; then
	# shellcheck disable=SC1090
	. "$HOME/dotfiles/bash_it"
fi

# Command line editing options.
set -o vi

# Only "exit" or "logout" will log off the system.
# set -o ignoreeof

# Set up text editing/viewing.
export LANG=en_US.utf-8
export CLICOLOR=1 # Colorizes output of ls and others.
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F-X-S-R-i-P%f (%i/%m) Line %lt/%L' # Better prompt, case-insensitive search by default.

export ENV=$HOME/.bashrc

# Set up command history.
export HISTSIZE=10000
export HISTFILESIZE=10000
# Make shells wirte to history immediately instead of on exit.
shopt -s histappend

# Aliases.
alias ll='ls -ltr'

# Functions.
function gitrm {
	git status | grep 'deleted' | awk '{print $3}' | xargs git rm
}

function latest {
	# shellcheck disable=SC2012,SC2086
	ls -t $1/* | head -n 1
}

function toss {
	for filename; do
		if [[ -e $HOME/.Trash/$filename ]]; then
			mv "${filename}" "${HOME}/.Trash/${filename}$(date +%Y%m%d%H%M%S)"
		else
			mv "${filename}" "${HOME}/.Trash"
		fi
	done
}

function variables() {
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

