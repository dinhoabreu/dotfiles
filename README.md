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

### Bash-it - base

```bash
bash-it enable plugin base
```

### Bash-it - aliases

```bash
bash-it enable alias tmux
bash-it enable alias git
```

### Bash-it - completions

```bash
bash-it enable completion git
```

### Git - config

Edit your `.gitconfig`

```bash
[include]
  path = ~/dotfiles/gitconfig
```

Enable [diff-so-fancy](https://github.com/stevemao/diff-so-fancy) to improve readability.

```
brew install diff-so-fancy
git config --global core.pager "LC_ALL=C diff-so-fancy | less --tabs=4 -RFX"
```

### Tmux - config

[Copy & Paste on OS X: A Better Future](https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future)

```
brew install tmux
brew install reattach-to-user-namespace
```

Edit your `.tmux.conf`

```bash
source-file ~/dotfiles/tmux.conf
```

Install [tmux-better-mouse-mode](https://github.com/NHDaly/tmux-better-mouse-mode)

```bash
git clone https://github.com/nhdaly/tmux-better-mouse-mode ~/dotfiles/tmux-plugins/tmux-better-mouse-mode
```

#### VS Code

[Persistent terminal sessions in VS Code](https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41)

In VS Code`s User Settings change:

```
"terminal.integrated.shell.osx": "code-shell"
```

Enable [Git Editor](https://code.visualstudio.com/docs/editor/versioncontrol#_vs-code-as-git-editor)

Edit your `.gitconfig`

```bash
[include]
  path = ~/dotfiles/gitconfig-vscode
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
and rename file to `vero_pt_br_v208aoc.oxt.zip`.

```
mv vero_pt_br_v208aoc.oxt.zip /tmp/
cd /tmp/
unzip vero_pt_br_v208aoc.oxt.zip
mkdir ~/.vim/spell
```

Then run following command on vim:

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

```bash
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

Configure _Hack Nerd Font_ into iTerm Profile Text and check _Use built-in Powerline glyphs_.
Configure _Hack Nerd Font_ into _Terminal: Integrated: Font Family_ into vscode.

### MacOS defaults

```
./dotfiles/macos
```

### GPG macOS

```bash
brew install gpg
git config --global gpg.program gpg
```

## Commands

### ssh_passwd

Encrypt/Decrypt password file using `gpg2`.

```bash
ssh_passwd # Decrypt ~/.ssh/passwd.asc
ssh_passwd save # Encrypt ~/.ssh/passwd
```
