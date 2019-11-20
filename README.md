# My dotfiles

## Installation

Checkout this repo into `$HOME/dotfiles`

```zsh
git clone https://github.com/dinhoabreu/dotfiles.git $HOME/dotfiles
```

### Add [Oh my zsh](https://github.com/robbyrussell/oh-my-zsh)

```zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

#### Plugins

References

- <https://gist.github.com/dogrocker/1efb8fd9427779c827058f873b94df95>

```zsh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

### Shell - setup

```zsh
echo 'source ~/dotfiles/zshrc' >.zshrc
```

### Git - config

Edit your `.gitconfig`

```zsh
[include]
  path = ~/dotfiles/gitconfig
```

Enable [diff-so-fancy](https://github.com/stevemao/diff-so-fancy) to improve readability.

```zsh
brew install diff-so-fancy
git config --global core.pager "LC_ALL=C diff-so-fancy | less --tabs=4 -RFX"
```

### Tmux - config

[Copy & Paste on OS X: A Better Future](https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future)

```zsh
brew install tmux
brew install reattach-to-user-namespace
```

Edit your `.tmux.conf`

```zsh
source-file ~/dotfiles/tmux.conf
```

Install [tmux-better-mouse-mode](https://github.com/NHDaly/tmux-better-mouse-mode)

```zsh
git clone https://github.com/nhdaly/tmux-better-mouse-mode ~/dotfiles/tmux-plugins/tmux-better-mouse-mode
```

#### VS Code

[Persistent terminal sessions in VS Code](https://medium.com/@joaomoreno/persistent-terminal-sessions-in-vs-code-8fc469ed6b41)

In VS Code`s User Settings change:

```txt
"terminal.integrated.shell.osx": "code-shell"
```

Enable [Git Editor](https://code.visualstudio.com/docs/editor/versioncontrol#_vs-code-as-git-editor)

Edit your `.gitconfig`

```zsh
[include]
  path = ~/dotfiles/gitconfig-vscode
```

### Vim - config

Link .vim and .vimrc to `$HOME`

```zsh
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

```zsh
mv vero_pt_br_v208aoc.oxt.zip /tmp/
cd /tmp/
unzip vero_pt_br_v208aoc.oxt.zip
mkdir ~/.vim/spell
```

Then run following command on vim:

```txt
:mkspell ~/.vim/spell/pt /tmp/pt_BR
```

### SSH - config

Link `ssh/config` and `ssh/passwd.asc` to `$HOME/.ssh/`

```zsh
ln -s ~/dotfiles/ssh/config ~/.ssh/config
ln -s ~/dotfiles/ssh/passwd.asc ~/.ssh/passwd.asc
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

Some cases like in my host `amsxd01` I have a git hook `.git/hooks/post-checkout` and `ln -s post-checkout .git/hooks/post-merge`

```zsh
#!/usr/bin/env bash

sed '/ProxyCommand.*amsxd01/d' ssh/config >~/.ssh/config
chmod go-rwx ~/.ssh/{config,passwd.asc}
```

and I need to remove the symbolic link `rm ~/.ssh/config`

### Terminal - Theme solarized

[Solarized](http://ethanschoonover.com/solarized) is a sixteen color palette (eight monotones, eight accent colors) designed for use with terminal and gui applications. It has several [unique properties](http://ethanschoonover.com/solarized#features). I designed this colorscheme with both precise CIELAB lightness relationships and a refined set of hues based on fixed color wheel relationships. It has been tested extensively in real world use on color calibrated displays (as well as uncalibrated/intentionally miscalibrated displays) and in a variety of lighting conditions.
[Nerd-fonts](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/SourceCodePro/Regular/complete/Sauce%20Code%20Pro%20Nerd%20Font%20Complete.ttf) for [vim-devicons](https://github.com/ryanoasis/vim-devicons) plugin.
Download and configure nerd-fonts into iTerm!

```zsh
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

Configure _Hack Nerd Font_ into iTerm Profile Text and check _Use built-in Powerline glyphs_.
Configure _Hack Nerd Font_ into _Terminal: Integrated: Font Family_ into vscode.

### MacOS defaults

```zsh
./dotfiles/macos
```

### GPG macOS

```zsh
brew install gpg
git config --global gpg.program gpg
```

## Commands

### ssh_passwd

Encrypt/Decrypt password file using `gpg2`.

```zsh
ssh_passwd # Decrypt ~/.ssh/passwd.asc
ssh_passwd save # Encrypt ~/.ssh/passwd
```
