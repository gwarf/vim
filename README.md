vim
===

vim configuration


Prerequisities
==============
vim-vundle should be available

Usage
=====
```
git clone git@github.com:gwarf/vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
ln -s ~/.vim/vimrc ~/.vimrc
vim +BundleInstall +qall
```

Automatted installation

``` sh
curl -L https://raw.github.com/gwarf/vim/master/install.sh | sh
```
