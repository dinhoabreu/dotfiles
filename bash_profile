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

# Keep this last so it can override general settings!
if [[ -f $HOME/dotfiles_local/bash_profile ]]; then
	# shellcheck disable=SC1090
	. "$HOME/dotfiles_local/bash_profile"
fi

# Set up fasd.
[[ -f $(command -v fasd) ]] && eval "$(fasd --init auto)"

# Bash-it
if [[ -d ${HOME}/.bash_it ]]; then
	export BASH_IT="${HOME}/.bash_it"
	export BASH_IT_THEME='powerline'
	export SCM_CHECK=true
	# shellcheck disable=SC1090
	source "$BASH_IT/bash_it.sh"
fi
