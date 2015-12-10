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

### SSH - config

Link `ssh/config` and `ssh/passwd.asc` to `$HOME/.ssh/`

```bash
ln -s ~/dotfiles/ssh/config ~/.ssh/config
ln -s ~/dotfiles/ssh/passwd.asc ~/.ssh/passwd.asc
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

Some cases like in my host `amsxd01` I have a git hook `.git/hooks/post-checkout`

```bash
#!/usr/bin/env bash

sed '/ProxyCommand.*amsxd01/d' ssh/config >~/.ssh/config
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

and I need to remove the symbolic link `rm ~/.ssh/config`

### Terminal - Theme solarized

[Solarized](http://ethanschoonover.com/solarized) is a sixteen color palette (eight monotones, eight accent colors) designed for use with terminal and gui applications. It has several [unique properties](http://ethanschoonover.com/solarized#features). I designed this colorscheme with both precise CIELAB lightness relationships and a refined set of hues based on fixed color wheel relationships. It has been tested extensively in real world use on color calibrated displays (as well as uncalibrated/intentionally miscalibrated displays) and in a variety of lighting conditions.

## Commands

### getsrt

Search subtitles for MP4/M4V files based on filename.

Requires `subtitler` command line and `PHP`. OSX install:

```bash
npm install subtitler -g
```

### addtags

Add tags onto MP4/M4V files based on filename pattern.

Requires `mp4tags` command line. OSX install:

```bash
brew install mp4v2
```

### ssh_passwd

Encrypt/Decrypt password file using `gpg2`.

```bash
ssh_passwd # Decrypt ~/.ssh/passwd.asc
ssh_passwd save # Encrypt ~/.ssh/passwd
```
