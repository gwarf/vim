" ~/.vimrc

set encoding=utf-8
set nocompatible " be iMproved
filetype off " required for vundle setup

" requires vundle installed
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Examples of repo management
" from github
" Bundle 'tpope/vim-fugitive'
" from vim-scripts
" Bundle 'FuzzyFinder'
" other git
" Bundle 'git://git.wincent.com/command-t.git'
" local machine
" Bundle 'file:///home/baptiste/path/to/plugin'

 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

" Install all bundles
" vim +BundleInstall +qall

Bundle 'tmatilai/gitolite.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mv/mv-vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle 'garbas/vim-snipmate'
Bundle 'SirVer/ultisnips'
Bundle "honza/vim-snippets"
Bundle 'guyzmo/vim-yaposting'
Bundle "guyzmo/notmuch-abook"
Bundle "benmills/vimux"
Bundle "elzr/vim-json"
Bundle "altercation/vim-colors-solarized"
Bundle "jtratner/vim-flavored-markdown"

filetype plugin indent on " required
syntax on

"let g:vim_json_syntax_conceal = 0

" set mouse=a
set mouse=

set visualbell
set noerrorbells

" Ensure modelines are enabled
set modeline

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red
highlight ExtraWhitespace ctermbg=red guibg=red

" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/
" Show spaces used for indenting (so you use only tabs for indenting).
match ExtraWhitespace /^\t*\zs \+/

set background=dark

colorscheme solarized
"colorscheme torte
" colorscheme zellner
" colorscheme elflord
" colorscheme desert
" colorscheme transparent

if &diff
  "colorscheme evening
  colorscheme torte
endif

" Diff colors
"highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
"highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
"highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
"highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black


" show line numbers
set number
" draw a vertical line
if v:version >= 703
set colorcolumn=80
endif

" vim-powerline
" https://github.com/Lokaltog/vim-powerline
"let g:Powerline_symbols = 'fancy'

"set cursorline
"highlight CursorLine term=reverse cterm=reverse
"set statusline=%F%m%r%h%w\ [Line\ %04l]\ [Col\ %04v]\ [%p%%]\ [ASCII\ \%03.3b]\ [Type\ %Y/%{&ff}]\ [%{strftime(\"%H:%M:%S-%d/%m/%Y\")}]
"set statusline=%F%m%r%h%w\ [%l,%v:%p%%]\ [ascii\ \%03.3b]\ %y[%{&ff}]\ [%{strftime(\"%H:%M:%S-%d/%m/%Y\")}]
set laststatus=2  " Affiche une barre de status en bas de l'écran
set title       " show title in console title bar
"set showmode    " shows the current mode in statusline
"set shm=a      " use shortest messages
set shortmess=t
"set showcmd     " Affiche les commandes dans la barre de status

set textwidth=72  " Largeur maxi du texte inséré

set history=2000  " Nombre de commandes dans l'historique

set viminfo='20,\"50  " Options du fichier ~/.viminfo

set backspace=2   " Active la touche Backspace

" Autorise le passage d'une ligne à l'autre avec les flèches gauche et droite
set whichwrap=b,s,<,>,[,]

" Garde toujours une ligne visible à l'écran au dessus du curseur
set scrolloff=1

" Essaye de garder le curseur dans la même colonne quand on change de ligne
set nostartofline

" automatic matching brace
set showmatch

" xterm-debian est un terminal couleur
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
    set t_Co=16
    set t_Sf=[3%dm
    set t_Sb=[4%dm
endif

set ignorecase
set incsearch
" No ignorecase if Uppercase chars in search
set scs
" highlight all matches...
set hls

" Keys
" Use jk instead of ESC for leaving insert mode
inoremap jk <ESC>
" Toggle search higlighting
nnoremap <F2> :set hls!<CR>

map # {v}! par 72
map @ {v}! par 72j
set wrapscan  " begin search at top when EOF reached

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

if v:version >= 700
  " Le découpage des folders se base sur l'indentation
  set foldmethod=indent

  " 12 niveaux d'indentation par défaut pour les folders
  set foldlevel=12
endif

set pastetoggle=<F10>

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

set shell="zsh"
if has("unix")
    let &shell="zsh"
endif

" Spell checking.
" use z= to get list of corrections
" use zg to add a word to the dict
if v:version >= 700
  autocmd BufNewFile,BufRead *.txt set spell spelllang=en,fr
  autocmd FileType tex set spell spelllang=fr,en
  autocmd BufNewFile,BufRead *.tex set spell spelllang=fr,en
  autocmd BufNewFile,BufRead *.sh set spell spelllang=en,fr
  autocmd BufEnter,BufNewFile,BufRead ~/tmp/mutt* set spell spelllang=en,fr
  augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
  augroup END

  map <F7> :set spell spelllang=fr<CR>
  map <S-F7> :set spell spelllang=en<CR>
  map <C-F7> :set nospell<CR>
  set mousemodel=popup

  " Spell colors
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
  highlight clear SpellCap
  highlight SpellCap term=underline cterm=underline
  highlight clear SpellRare
  highlight SpellRare term=underline cterm=underline
  highlight clear SpellLocal
  highlight SpellLocal term=underline cterm=underline
endif

function! s:DisplayStatus(msg)
  echohl Todo
  echo a:msg
  echohl None
endfunction

if has("autocmd")
  " Delete spaces at EOL
  " FIXME need to disable this when writing mails
  " autocmd BufWrite * silent! %s/[\r \t]\+$//
  "Autoremove ^M in DOS files
  autocmd BufRead * silent! %s/$//
endif

" Press F5 to suppress white spaces at EOL
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" TODO ensure that tab are not replaced on python files
function! CleanCode()
  %retab
  silent! %s/$//
  call s:DisplayStatus('Code cleaned')
endfunction

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
function! s:CursorOldPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal g`\""
  endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()

" Tabs and windows
set   splitbelow   " Create new window below current one.
map <M-Left> :tabprevious<CR>
map <M-Right> :tabnext<CR>
highlight TabLine term=none cterm=none
highlight TabllineSel ctermbg=darkblue

" Sign markers
sign define SignSymbol text=>> linehl=Warning texthl=Error

let s:signMarks = {}
let s:jumpMarks = {}

function! MarkSign()
  let filename = bufname(winbufnr(winnr()))
  let ln = line(".")
  if (has_key(s:signMarks, filename))
    let s:signMarks[filename] += 1
  else
    let s:signMarks[filename] = 1
  endif
  exe ':sign place ' . s:signMarks[filename] . ' line=' . ln . ' name=SignSymbol file=' . expand('%:p')
endfunction

function! JumpToSign()
  let filename = bufname(winbufnr(winnr()))
  if (has_key(s:signMarks, filename))
    if (has_key(s:jumpMarks, filename))
      let s:jumpMarks[filename] += 1
    else
      let s:jumpMarks[filename] = 1
    endif
    if (s:jumpMarks[filename] > s:signMarks[filename])
      let s:jumpMarks[filename] = 1
    endif
    silent! execute ':sign jump ' . s:jumpMarks[filename] . ' file=' . expand('%:p')
  endif
endfunction

" TTY
set ttyfast
set ttybuiltin
"       ttyscroll:      turn off scrolling -> faster!
set   ttyscroll=1
"       ttytype:
" set   ttytype=rxvt

" Default indentation
set autoindent
"set cindent
set cinoptions=(0 " Options d'indentation pour un fichier C
"set tabstop=2       " Taille des tabulations
"set expandtab       " Remplacer les tab par des espaces
"set shiftwidth=2    " taille de l'indentation.
set smartindent     " smart indent
set smartcase

" C
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd BufNewfile,BufRead *.c,*.h,*.cpp set expandtab tabstop=2
"let c_minlines = 200
let c_comment_strings = 1

" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" HTML
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufNewFile,BufRead *.html set autoindent formatoptions=tcqwl textwidth=72 shiftwidth=2 softtabstop=2 tabstop=2
let use_xhtml = 1
let html_use_css = 1

" Java
autocmd FileType java set omnifunc=javacomplete#Complete, set completefunc=javacomplete#CompleteParamsInfo 
autocmd BufNewfile,BufRead *.java,*.jsp, set autoindent noexpandtab tabstop=4 shiftwidth=4
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_highlight_debug=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150
let java_comment_strings=1
let java_highlight_java_lang_ids=1
"Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

" JavaScript
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
let g:syntax_extra_javascript='doxygen'

" Perl
autocmd BufNewFile,BufRead *.pl,*.pm, set shiftwidth=2

" PHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufNewFile,BufRead *.php,*.php[345] set shiftwidth=4 expandtab softtabstop=4 tabstop=4
autocmd BufNewFile,BufRead *.php5 set syntax=php
let php_sql_query = 1
let php_noShortTags = 1
let php_parent_error_close = 1
"let php_parent_error_open = 1
"let php_minlines=300
let php_htmlInStrings=1
"let php_folding = 1

" Python
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python set expandtab tabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" TeX
autocmd FileType tex set omnifunc=syntaxcomplete#Complete
autocmd FileType tex set tabstop=2 shiftwidth=2 nocindent
autocmd BufNewFile,BufRead *.tex set autoindent formatoptions=tcq2l textwidth=72 shiftwidth=2 softtabstop=2 tabstop=2

" Text
autocmd FileType text setlocal textwidth=72
autocmd BufNewFile,BufRead *.txt set tw=72 nocindent

" Shell
autocmd FileType sh setlocal textwidth=72
autocmd BufNewFile,BufRead *.sh set tw=72 autoindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

" XML
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType xml set tabstop=2 shiftwidth=2
"autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim
autocmd BufNewFile,BufRead *.sgml,*.xsl set autoindent formatoptions=tcq2l textwidth=72 shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab

" doxygen
let g:load_doxygen_syntax=1

" Syntax fvwm
:au! BufNewFile,BufRead ~/.fvwm2/.fvwm*  let b:fvwm_version = 2 |
      \ set filetype=fvwm

" do not change end of file
" augroup EOL
" autocmd!
" autocmd BufWritePre * call EolSavePre()
" autocmd BufWritePost * call EolSavePost()
" augroup END

" function! EolSavePre()
"   let b:save_bin = &bin
"   if ! &eol
"     let &l:bin = 1
"   endif
" endfunction

" function! EolSavePost()
"   let &l:bin = b:save_bin
" endfunction

" make :Man command avaliable
"source $VIMRUNTIME/ftplugin/man.vim
" Default MANPAGER vimmanpager doesn't play well
" with the :Man command and we don't want to see raw colour codes
" so we use sed to strip them.
let $MANPAGER = "sed -e 's:\\x1B\\[[[:digit:]]\\+m::g'"

" Mutt
" autocmd BufEnter /tmp/mutt* so ~/.vim/mutt.colors
" :help fo-table
autocmd BufEnter,BufNewFile,BufRead ~/tmp/mutt* set nocindent ft=mail et textwidth=72 formatoptions=tcqn
"autocmd BufNewfile,BufRead /tmp/mutt*[0-9] set nobk nowb
" mutt: insert attachment with ranger
fun! RangerMuttAttach()
    if filereadable('/tmp/chosendir')
        silent !ranger --choosefiles=/tmp/chosenfiles --choosedir=/tmp/chosendir "$(cat /tmp/chosendir)"
    else
        silent !ranger --choosefiles=/tmp/chosenfiles --choosedir=/tmp/chosendir
    endif
    if filereadable('/tmp/chosenfiles')
       " call system('sed "s/\(.*\)/Attach: \1/" /tmp/chosenfiles > /tmp/muttattach')
        call append('.', map(readfile('/tmp/chosenfiles'), '"Attach: ".v:val'))
        exec 'read /tmp/muttattach'
        call system('rm /tmp/chosenfiles /tmp/muttattach')
    endif
    redraw!
endfun
map <C-a> magg/Reply-To<CR><ESC>:call RangerMuttAttach()<CR>`a

match Todo /\s\+$/

" use tab for auto-expansion in menus
set wc=<TAB>

" show a list of all matches when tabbing a command
set wmnu

" how command line completion works
set wildmode=list:longest,list:full
set wildchar=<TAB>
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz

function! MultipleAutoCompletion()
  if &omnifunc != ''
    return "\<C-x>\<C-o>"
  elseif &dictionary != ''
    return "\<C-x>\<C-k>"
  else
    return "\<C-x>\<C-n>"
  endif
endfunction

" some filetypes got lower priority
set su=.h,.bak,~,.o,.info,.swp,.obj

",v brings up ~/.vimrc
map ,v :sp ~/.vimrc
",V reloads it -- making all changes active (have to save first)
map ,V :source ~/.vimrc

" N'utilise pas le mode Ex, utilise Q pour le formatage
map Q gq

" perl style # commenting
autocmd FileType php,yaml  noremap <F5> :s/\v^(\s*)/\1#/ <CR>
autocmd FileType php,yaml  noremap <F6> :s/\v^(\s*)#/\1/ <CR>
" C style // commenting
autocmd FileType c,cpp,php noremap <F5> :s+\v^(\s*)+\1//+ <CR>
autocmd FileType c,cpp,php noremap <F6> :s+\v^(\s*)//+\1+ <CR>
" vim commenting
autocmd FileType vim noremap <F5> :s/\v^(\s*)/\1"/ <CR>
autocmd FileType vim noremap <F6> :s/\v^(\s*)"/\1/ <CR>

" Raccourcis pour la prog
" imap ( ()<Left>
" noremap " ""<Left>
" imap [ []<Left>
" imap { {<CR><CR>}<Up>

" Tabs commands
map <M-Left> :tabprevious<CR>
map <M-Right> :tabnext<CR>

" Abbréviations
abbr qqch quelque chose
abbr cad c'est à dire

" Définition des régalges GUI
if has("gui_running")
  if has("gui_gtk2")
      set guifont=Inconsolata\ 16
    elseif has("x11")
        " set guifont=-*-courier-medium-r-normal-*-11-140-*-*-m-iso10646-1
        " set guifont=-misc-fixed-medium-r-semicondensed-*-*-111-75-75-c-*-iso8859-15
        set guifont=Inconsolata\ 16
    else
        set guifont=Inconsolata\ 16
        " set guifont=DejaVu_Sans_Mono:h9:cBook
    endif
    " Ajoute une marge à gauche pour afficher les +/- des replis
    set foldcolumn=2
  "Nombre de colonnes à afficher
    set co=150
    "Nombre de lignes à afficher
    set lines=41
   " Le bouton droit affiche une popup
    set mousemodel=popup_setpos
    colorscheme solarized
    set background=dark
    set ch=2    " Make command line two lines high
    set mousehide   " Hide the mouse when typing text
    " Make shift-insert work like in Xterm
    map <S-Insert> <MiddleMouse>
    map! <S-Insert> <MiddleMouse>
    " Set nice colors
    " background for normal text is light grey
    " Text below the last line is darker grey
    " Cursor is green, Cyan when ":lmap" mappings are active
    " Constants are not underlined but have a slightly lighter background
    " highlight Normal guibg=grey90
    " hi Normal guibg=black guifg=lightgrey
    highlight Cursor guibg=Green guifg=NONE
    highlight lCursor guibg=Cyan guifg=NONE
    highlight NonText guibg=grey80
    highlight Constant gui=NONE guibg=grey95
    highlight Special gui=NONE guibg=grey95
endif
" Fin de définition des reglages GUI

" eclim
" let g:EclimHome = '/usr/share/vim/vimfiles/eclim'
" let g:EclimEclipseHome = '/usr/share/eclipse'
let g:EclimBrowser = 'firefox'
command -range -nargs=* Google call eclim#web#SearchEngine('http://www.google.fr/search?q=<query>', <q-args>, <line1>, <line2>)

" Use Ctrl-Space for omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Use space fo toggle current fold
nnoremap <Space> za

" VisualSearch using * and #
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
