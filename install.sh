#!/usr/bin/env bash

CURRENT_DIR=`dirname $0`
cd ${CURRENT_DIR}
dotfiles_path=`pwd`

files=`find . -name "_*"`
for file in ${files} ; do
    filename=`basename ${file}`
    ln -s ${dotfiles_path}/${filename} ~/${filename/_/.}
done

#=================#
# vim             #
#=================#
brew install vim 

# make vim backup dir
mkdir -p ~/backup/vim

# ctags install
brew install ctags

#=================#
# zsh             #
#=================#
# make zsh plugin dir
#mkdir -p ~/.zsh_plugins

# install zaw
#git clone git://github.com/zsh-users/zaw.git ~/.zsh_plugins/zaw

# make cdr cache dir
mkdir -p ~/.zshcache/shell

