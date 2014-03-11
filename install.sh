#!/bin/sh

echo 'Cloning vim'
mkdir -p "$HOME/repos/gwarf"
cd $_
git clone git://github.com/gwarf/vim.git

echo 'Symlinking vim'
ln -s vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

echo 'Retrieving sub modules'
cd ~/.vim
git submodule init
git submodule update
