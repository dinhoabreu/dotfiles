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

Locate `powerline.conf`
```bash
python_resolver /powerline/bindings/tmux/powerline.conf
# Example output: /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
```

Edit your `.tmux.conf`
```bash
# Use the output of python_resolver here
source-file /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf
source-file ~/dotfiles/tmux.conf
```

### Vim - config

Link .vim and .vimrc to `$HOME`
```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/vim ~/.vim
# Install plugin manager
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Install plugins
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean +BundleInstall +qall
```
