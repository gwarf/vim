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
" Snippets for UltiSnipps
Plug 'honza/vim-snippets'
" Puppet-related stuff
Plug 'mv/mv-vim-puppet'
" Syntax validation
Plug 'scrooloose/syntastic'
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

" draw a vertical line
if v:version >= 703
set colorcolumn=80
endif

" Enable modelines
set modeline

" use tab for expansion in menus
set wildchar=<TAB>

" Competion mode for wildchar in menus
set wildmode=list:longest,full

" Search
set ignorecase
" No ignorecase if pattern contains Uppercase char
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

" Use F10 to toggle paste mode
set pastetoggle=<F10>

" Do not unload buffers on abandon (opening a new file un current buffer)
" Use Ctrl-o to switch back to location save in jumplist
set hidden

" Backup configuration
silent execute '!mkdir -p $HOME/.vimbackup'
silent execute '!mkdir -p $HOME/.vimswap'
silent execute '!mkdir -p $HOME/.vimviews'
set backup  " Bacup modified files
set backupdir=$HOME/.vimbackup
set backupskip=/tmp/*,/private/tmp/*
set writebackup

" Swap file configuration
set swapfile
set directory=$HOME/.vimswap

""""""""""""""""""""""""""""""
" *-(specific|related) options
""""""""""""""""""""""""""""""

" Mail edition for mutt
" :help fo-table
" autocmd BufEnter /tmp/mutt* so ~/.vim/mutt.colors
autocmd BufEnter,BufNewFile,BufRead ~/tmp/mutt* set spell spelllang=en,fr complete+=kspell noci ft=mail et fo=tcqnaw

""""""""""""""""""
" Custom functions
""""""""""""""""""

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
function! s:CursorOldPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal g`\""
  endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()

"""""""""""""""""""""""
" Plugins configuration
"""""""""""""""""""""""

" Syntastic
" https://github.com/scrooloose/syntastic
" Always populate location list with errors
"let g:syntastic_always_populate_loc_list = 1
" Automatically close error window
"let g:syntastic_auto_loc_list = 2
" Jump to the first error detected
"let g:syntastic_auto_jump = 2
"let g:syntastic_check_on_open = 0
"let g:syntastic_puppet_puppetlint_quiet_messages = { "regex": "line has more than 80 characters" }
"let g:syntastic_puppet_puppetlint_args = "--no-class_inherits_from_params_class-check"

" Let's code with python 2
" Use virtualenv for installing/conifugring python stuff
"let g:syntastic_python_python_exec = '/usr/bin/python2'
"let g:syntastic_python_flake8_exec = 'flake8-python2'
" https://github.com/liamcurry/py3kwarn
" https://docs.python.org/3/whatsnew/3.0.html
" https://docs.python.org/2.6/library/2to3.html#fixers
"let g:syntastic_python_checkers=['flake8']
"let g:syntastic_python_checkers=['flake8', 'py3kwarn']

" UltiSnips
let g:snips_author_email='bgrenier@gnubila.fr'
let g:snips_email='bgrenier@gnubila.fr'
"let g:snips_author_email='baptiste@bapt.name'
let g:snips_author='Baptiste Grenier'
let g:snips_author_initials='BG'
let g:snips_company='gnúbila'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Custom snippets
let g:UltiSnipsSnippetsDir        = '~/.vim/UltiSnips/'

" No more user tab/s-tab with youcompleteme to allow to use tab for UltiSnips
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" Working
" Not using <tab> with https://github.com/Valloric/YouCompleteMe.
" YouCompleteMe: use tab/s-tab or c-n/c-p to navigate options
" UltiSnips: use c-j to trigger snippet
"let g:UltiSnipsExpandTrigger       ="<c-j>"

" Goal
" YouCompleteMe: use tab/s-tab or c-n/c-p to navigate options
" UltiSnips: use tab to trigger snippet
"let g:UltiSnipsExpandTrigger       ="<tab>"

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

"au BufEnter,BufRead,BufNewFile,Buf * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<cr>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" vim:set ft=vim et sw=2:
