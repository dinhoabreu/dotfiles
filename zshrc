export ZSH="/Users/edison/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# User configuration
for dir in ~/dotfiles/bin/osx ~/dotfiles/bin; do
	if ! [[ $PATH = *$dir* ]]; then
		PATH=$dir:$PATH
	fi
done

export LANG=en_US.UTF-8
export EDITOR='vim'
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F-X-S-R-i-P%f (%i/%m) Line %lt/%L' # Better prompt, case-insensitive search by default.
alias ll='ls -ltr'

set -o vi
source ~/dotfiles/zsh/functions.sh

bindkey '^ ' autosuggest-accept