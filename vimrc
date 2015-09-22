" ~/.vimrc

filetype off " required for vundle setup

call plug#begin('~/.vim/plugged')

" Snippets
Plug 'SirVer/ultisnips'
" Completion
Plug 'Valloric/YouCompleteMe'
" Colorscheme
Plug 'altercation/vim-colors-solarized'
" Tabular alignement
Plug 'godlygeek/tabular'
" Puppet-related stuff
Plug 'mv/mv-vim-puppet'
" git integration
Plug 'tpope/vim-fugitive'
" Sensible default settings
Plug 'tpope/vim-sensible'
" Easy change of surrounding stuff (tags, quotes...)
Plug 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call plug#end()

" Required to allow to override sensible.vim configuration
runtime plugin/sensible.vim

" Theme
set background=dark
colorscheme solarized

" Create new window below current one.
set splitbelow

" Show line number
set number

" Enable modelines
set modeline

" use tab for expansion in menus
set wildchar=<TAB>

" Competion mode for wildchar in menus
set wildmode=list:longest,full

" Search
" No ignorecas if pattenrs contains Uppercase char
set smartcase
" highlight all matches
set hlsearch

" Default indentation: 2 space
set expandtab
set shiftwidth=2    " taille de l'indentation.
set tabstop=2       " Taille des tabulations

" Highlight problematic whitespace
set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:.

"""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""

" UltiSnips
" Trigger configuration.
" Do not use <tab> with https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"let g:snips_author_email='baptiste@bapt.name'
let g:snips_author_email='bgrenier@gnubila.fr'
let g:snips_email='bgrenier@gnubila.fr'
let g:snips_author='Baptiste Grenier'
let g:snips_author_initials='BG'
let g:snips_company='gnúbila'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Custom snippets
let g:UltiSnipsSnippetsDir        = '~/.vim/UltiSnips/'

" vim:set ft=vim et sw=2:
