#!/bin/sh

echo 'Cloning vim'
git clone git://github.com/gwarf/vim.git ~/.vim

echo 'Symlinking vimrc'
ln -s ~/.vim/vimrc ~/.vimrc

echo 'Installing plugins'
vim +PlugInstall
