if [ -f $HOME/.profile ]; then
    . $HOME/.profile
fi

if [ -f $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

#Test if "brew" exists
if [[ -f `command -v brew` ]] && [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#Command line editing options.
set -o vi

#Only "exit" or "logout" will log off the system.
#set -o ignoreeof

#Set up text editing/viewing.
export LANG=en_US.utf-8
export CLICOLOR=1 #Colorizes output of ls and others.
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F-X-S-R-i-P%f (%i/%m) Line %lt/%L' # Better prompt, case-insensitive search by default.

export ENV=$HOME/.bashrc

#Set up command history.
export HISTSIZE=10000
export HISTFILESIZE=10000
#Make shells wirte to history immediately instead of on exit.
shopt -s histappend
export PROMPT_COMMAND='history -a'

#Aliases.
alias ll='ls -ltr'


#Functions.
function gitrm {
    git status | grep 'deleted' | awk '{print $3}' | xargs git rm
}
function latest {
    ls -t $1/* | head -n 1
}
function toss {
    for filename; do
        if [ -e $HOME/.Trash/$filename ]; then
            mv "${filename}" "${HOME}/.Trash/${filename}$(date +%Y%m%d%H%M%S)"
        else
            mv "${filename}" "${HOME}/.Trash"
        fi
    done
}
function variables() {
    comm -23 <(declare) <(declare -f) ;
}

#The command line prompt.
red="\[\e[0;31m\]"
blue="\[\e[0;34m\]"
green="\[\e[0;32m\]"
gray="\[\e[0;30m\]"
white="\[\e[0;00m\]"
case "$TERM" in
    xterm|\
    xterm-color|\
    xterm-256color|\
    screen|\
    screen-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    export PS1="$red\u$blue@\h$green:\W \$$white " # No date
    # export PS1="$gray[\$(date +'%Y-%m-%d %H:%M:%S')] $red\u$blue@\h$gray:$green\W \$$white "
else
    export PS1='\u@\h:\w\n\$ ' #No date
    # export PS1="[\$(date +'%Y-%m-%d %H:%M:%S')] \u@\h:\w\n\$ "
fi
if [[ $TERM_PROGRAM == iTerm* ]]; then
  iterm_title="\[\e]0;\u@\h:\w\a\]"
  PS1="${iterm_title}$PS1"
fi

#The powerline
if [ "$POWERLINE" = "1" ]; then
    POWERLINE_PATH=`python_resolver /powerline/bindings/bash/powerline.sh`
    [ -f "$POWERLINE_PATH" ] && . "$POWERLINE_PATH"
fi

#Keep this last so it can override general settings!
if [ -f $HOME/dotfiles_local/bash_profile ]; then
    . $HOME/dotfiles_local/bash_profile
fi

#Set up fasd.
[[ -f `command -v fasd` ]] && eval "$(fasd --init auto)"
