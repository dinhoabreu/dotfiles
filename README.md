# My dotfiles

## Installation

Checkout this repo into `$HOME/dotfiles`
```bash
git clone https://github.com/dinhoabreu/dotfiles.git $HOME/dotfiles
```

### Shell - setup

Edit your `.profile`
```bash
if [ -f ~/dotfiles/profile ]; then
  . ~/dotfiles/profile
fi
```

Edit your `.bashrc`
```bash
if [ -f ~/dotfiles/bashrc ]; then
  . ~/dotfiles/bashrc
fi
```

Edit your `.bash_profile`
```bash
if [ -f ~/dotfiles/bash_profile ]; then
  . ~/dotfiles/bash_profile
fi
```

### Git - config

Edit your `.gitconfig`
```bash
[include]
  path = ~/dotfiles/gitconfig
```

### Tmux - config

Edit your `.tmux.conf`
```bash
if-shell 'test -z "$POWERLINE_CONFIG_COMMAND"' 'set-environment -g POWERLINE_CONFIG_COMMAND powerline-config'
run-shell 'eval $POWERLINE_CONFIG_COMMAND tmux setenv'
run-shell 'eval $POWERLINE_CONFIG_COMMAND tmux source'
source ~/dotfiles/tmux.conf
```

### Vim - config

Link .vim and .vimrc to `$HOME`
```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
# Install plugin manager
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Install plugins
vim --noplugin -u /Users/edison/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean +BundleInstall +qall
```
