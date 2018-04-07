#!/usr/bin/env bash

CURRENT_DIR=`dirname $0`
cd ${CURRENT_DIR}
dotfiles_path=`pwd`

files=`find . -name "_*"`
for file in ${files} ; do
    filename=`basename ${file}`
    ln -s ${dotfiles_path}/${filename} ~/${filename/_/.}
done

# Change Login Shell
chsh -s /bin/zsh

#=================#
# vim             #
#=================#
brew install vim --with-lua
# install vim bundle
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# make vim backup dir
mkdir -p ~/backup/vim

# ctags install
brew install ctags

#=================#
# zsh             #
#=================#
# make zsh plugin dir
mkdir -p ~/.zsh_plugins

# install zaw
git clone git://github.com/zsh-users/zaw.git ~/.zsh_plugins/zaw

# make cdr cache dir
mkdir -p ~/.zshcache/shell

#=================#
# tmux            #
#=================#
# install tmux
brew intall tmux

# install tpm
mkdir -p ~/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

