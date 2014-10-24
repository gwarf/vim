#!/bin/sh

if [ -d ~/.vim ]; then
  echo '~/.vim already exists, exiting.'
  exit 1
fi

echo 'Cloning vim'
git clone git://github.com/gwarf/vim.git ~/.vim

if [ -e ~/.vimrc ]; then
  echo '~/.vimrc already; skip linking to new one'
else
  echo 'Symlinking vimrc'
  ln -s ~/.vim/vimrc ~/.vimrc
  echo 'Installing plugins'
  vim +PlugInstall
fi

