# vim

Deprecated, merged to my [main messy dotfiles repository](https://github.com/gwarf/dotfiles)

vim configuration.

## Usage

```
git clone git@github.com:gwarf/vim.git ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/.vim/vimrc ~/.vimrc
vim +PlugInstall
```

Automatted installation

``` sh
curl -L https://raw.github.com/gwarf/vim/master/install.sh | sh
```
