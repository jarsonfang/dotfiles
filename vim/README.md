## Install Vim:

```bash
$ sudo apt install vim
```

## Download configuration

```bash
$ cd
$ git clone https://github.com/jarsonfang/dotfiles.git
$ rm -rf .vim .vimrc
$ ln -s dotfiles/vim .vim
$ ln -s dotfiles/vim/vimrc .vimrc
```

## Install vim plugins

Launch vim and run `:PlugInstall` command or run `vim +PlugInstall +qall` from command line directly.  
After done that, please go to <https://github.com/Valloric/YouCompleteMe> or use `:help youcompleteme` command
to see more about the installation of YouCompleteMe plugin.

## Install powerline fonts

```bash
$ git clone https://github.com/powerline/fonts.git
$ cd fonts && ./install.sh
```

after powerline fonts installed, configure the terminal to use one of the powerline fonts.

## Install search tools

```bash
$ sudo apt install ripgrep silversearcher-ag universal-ctags
```

