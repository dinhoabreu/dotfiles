# My dotfiles

## Installation

Checkout this repo into `$HOME/dotfiles`

```bash
git clone https://github.com/dinhoabreu/dotfiles.git $HOME/dotfiles
```

### Add [bash-it](https://github.com/Bash-it/bash-it)

```bash
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
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

Edit your `.inputrc`

```bash
$include ~/dotfiles/inputrc
```

### Bash-it - aliases

```bash
bash-it enable alias tmux
```

### Bash-it - completions

```bash
bash-it enable completion git
```

### Bash-it - plugins

```bash
bash-it enable plugin fasd
```

### Git - config

Edit your `.gitconfig`

```bash
[include]
  path = ~/dotfiles/gitconfig
```

Enable [diff-so-fancy](https://github.com/stevemao/diff-so-fancy) to improve readability.

```
brew install gnu-sed
npm install -g diff-so-fancy
git dsf # dsf is a git-alias for diff-so-fancy
```

### Tmux - config

Edit your `.tmux.conf`

```bash
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

To add spell brasilian portuguese language, download 
[pt_BR dictionary](http://downloads.sourceforge.net/project/aoo-extensions/1375/8/vero_pt_br_v208aoc.oxt?r=http%3A%2F%2Fextensions.openoffice.org%2Fen%2Fproject%2Fvero-brazilian-portuguese-spellchecking-dictionary-hyphenator&ts=1477079390&use_mirror=ufpr)
and rename file to `vero_pt_br_v208aoc.oxt.zip`. Extract the file `/tmp/pt_BR.dic` into `/tmp/` then run following command on vim:

```
:mkspell ~/.vim/spell/pt /tmp/pt_BR
```

### SSH - config

Link `ssh/config` and `ssh/passwd.asc` to `$HOME/.ssh/`

```bash
ln -s ~/dotfiles/ssh/config ~/.ssh/config
ln -s ~/dotfiles/ssh/passwd.asc ~/.ssh/passwd.asc
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

Some cases like in my host `amsxd01` I have a git hook `.git/hooks/post-checkout` and `ln -s post-checkout .git/hooks/post-merge`

```bash
#!/usr/bin/env bash

sed '/ProxyCommand.*amsxd01/d' ssh/config >~/.ssh/config
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

and I need to remove the symbolic link `rm ~/.ssh/config`

### Terminal - Theme solarized

[Solarized](http://ethanschoonover.com/solarized) is a sixteen color palette (eight monotones, eight accent colors) designed for use with terminal and gui applications. It has several [unique properties](http://ethanschoonover.com/solarized#features). I designed this colorscheme with both precise CIELAB lightness relationships and a refined set of hues based on fixed color wheel relationships. It has been tested extensively in real world use on color calibrated displays (as well as uncalibrated/intentionally miscalibrated displays) and in a variety of lighting conditions.
[Nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf) for [vim-devicons](https://github.com/ryanoasis/vim-devicons) plugin.
Download and configure nerd-fonts into iTerm!

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
