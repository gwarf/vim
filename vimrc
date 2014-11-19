" ~/.vimrc

set encoding=utf-8
set nocompatible " be iMproved
filetype off " required for vundle setup

call plug#begin('~/.vim/plugged')

"Plug 'garbas/vim-snipmate'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'benmills/vimux'
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'guyzmo/notmuch-abook'
Plug 'guyzmo/vim-yaposting'
Plug 'honza/vim-snippets'
Plug 'jtratner/vim-flavored-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mv/mv-vim-puppet'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tmatilai/gitolite.vim'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

syntax enable

"let g:vim_json_syntax_conceal = 0

" set mouse=a
set mouse=

set visualbell
set noerrorbells

" Ensure modelines are enabled
set modeline

set background=dark
colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_visibility="high"

set list
set listchars=tab:>.,trail:.,extends:\#,nbsp:. " Highlight problematic whitespace

" Highlight redundant whitespaces and tabs.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"if &diff
  "colorscheme evening
  "colorscheme torte
"endif

" Diff colors
"highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=black
"highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black
"highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
"highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" Do not unload buffers on abandon (opening a new file un current buffer)
" Use Ctrl-o to switch back to location save in jumplist
set hidden

" show line numbers
set number

" draw a vertical line
if v:version >= 703
set colorcolumn=80
endif

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_line_fonts = 1

"set cursorline
"set cursorcolumn
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
let mapleader=","
" To use space as leader
" See how it behaves with space mapped to toggle folding...
"let mapleader=" "
"let mapleader = "\<Space>"
"nnoremap <SPACE> <Nop>

" Use jk instead of ESC for leaving insert mode
inoremap jk <ESC>
" Toggle search higlighting
nnoremap <F2> :set hls!<CR>

" Reselect after indent so it can easily be repeated
vnoremap < <gv
vnoremap > >gv

" Use :w!! to write to a read only file by calling sudo
cmap w!! %!sudo tee > /dev/null %

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
  autocmd BufNewFile,BufRead *.md set spell spelllang=en complete+=kspell
  autocmd BufNewFile,BufRead *.tex set spell spelllang=fr,en complete+=kspell
  autocmd BufNewFile,BufRead *.sh set spell spelllang=en complete+=kspell
  autocmd FileType tex set spell spelllang=fr,en complete+=kspell
  autocmd FileType gitcommit setlocal spell spelllang=en complete+=kspell

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

" TTY
set ttyfast
set ttybuiltin
"       ttyscroll:      turn off scrolling -> faster!
set   ttyscroll=1
"       ttytype:
" set   ttytype=rxvt

function! s:DisplayStatus(msg)
  echohl Todo
  echo a:msg
  echohl None
endfunction

if has("autocmd")
  " Delete spaces at EOL
  " FIXME need to disable this when writing mails
  " autocmd BufWrite * silent! %s/[\r \t]\+$//
  autocmd BufWrite * silent! call CleanCode()
  "Autoremove ^M in DOS files
  autocmd BufRead * silent! %s/$//
endif

" Press F8 to suppress white spaces at EOL
:nnoremap <silent> <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

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

" Default indentation
set autoindent
"set cindent
set cinoptions=(0 " Options d'indentation pour un fichier C
set tabstop=2       " Taille des tabulations
" Will change tabs in existing files
set expandtab
set smarttab
set shiftwidth=2    " taille de l'indentation.
set smartindent     " smart indent
set smartcase

" Text
autocmd FileType text setlocal textwidth=72
autocmd BufNewFile,BufRead *.txt set tw=72 nocindent

" Shell
autocmd FileType sh setlocal textwidth=72
autocmd BufNewFile,BufRead *.sh set tw=72 autoindent expandtab shiftwidth=2 softtabstop=2 tabstop=2

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
autocmd BufEnter,BufNewFile,BufRead ~/tmp/mutt* set spell spelllang=en,fr complete+=kspell noci ft=mail et tw=72 fo=tcqnaw
"autocmd BufEnter,BufNewFile,BufRead ~/tmp/mutt* set fo+=aw
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
map <M-A> magg/Reply-To<CR><ESC>:call RangerMuttAttach()<CR>`a

match Todo /\s\+$/

" use tab for auto-expansion in menus
set wc=<TAB>

" show a list of all matches when tabbing a command
set wildmenu
set wildmode=list:longest,full

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
"imap <Tab> <C-P>

" Simpler splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Abbreviations
ab qqch quelque chose
ab cad c'est à dire
ab teh the

" GUI settings
if has("gui_running")
  colorscheme solarized
  set background=dark
  set guifont=Inconsolata\ 16
  set foldcolumn=2
  " Number of columns to display
  set co=150
  " Number of lines to display
  set lines=41
  " popup on right click
  set mousemodel=popup_setpos
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

" eclim
" let g:EclimHome = '/usr/share/vim/vimfiles/eclim'
" let g:EclimEclipseHome = '/usr/share/eclipse'
let g:EclimBrowser = 'firefox'
"command -range -nargs=* Google call eclim#web#SearchEngine('http://www.google.fr/search?q=<query>', <q-args>, <line1>, <line2>)

" Use Ctrl-Space for omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Use space fo toggle current fold
nnoremap <Space> za

" map the align command to align fat comma's, do need to visual select first
vmap <LEADER>= :Align =><CR>

" open vimrc in new vsplit for quick config changes
nmap <leader>v :tabnew ~/.vimrc<cr>:lcd ~/.vim<cr>
" auto source it on save
autocmd! bufwritepost .vimrc source %

" VisualSearch using * and #
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" The Silver Searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
"command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Load session if any
augroup sourcesession
  autocmd!
  autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \ source Session.vim |
        \ endif
augroup END

" CtrlP
" Fix ctrl-p's mixed mode https://github.com/kien/ctrlp.vim/issues/556
"let g:ctrlp_extensions = ['mixed']
nnoremap <c-p> :CtrlPMixed<cr>

" Syntastic
" https://github.com/scrooloose/syntastic
" Always populate location list with errors
let g:syntastic_always_populate_loc_list = 1
" Automatically close error window
let g:syntastic_auto_loc_list = 2
" Jump to the first error detected
let g:syntastic_auto_jump = 2
let g:syntastic_check_on_open = 1
let g:syntastic_puppet_puppetlint_quiet_messages = { "regex": "line has more than 80 characters" }

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:snips_author_email='baptiste@bapt.name'
let g:snips_author='Baptiste Grenier'

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Custom snippets
let g:UltiSnipsSnippetsDir        = '~/.vim/UltiSnips/'

" promptline.vim
"let g:promptline_theme = 'jelly'
let g:promptline_theme = 'powerlineclone'
let g:promptline_preset = {
  \'a' : [ promptline#slices#host() ],
  \'b' : [ promptline#slices#user() ],
  \'c' : [ promptline#slices#cwd() ],
  \'x' : [ promptline#slices#git_status() ],
  \'y' : [ promptline#slices#vcs_branch({'hg': 1, 'svn': 1}) ],
  \'z' : [ promptline#slices#jobs() ],
  \'warn' : [ promptline#slices#last_exit_code() ]}
" If no powerline symbols are available:
"let g:promptline_powerline_symbols = 0
"let g:promptline_symbols = {
"  \ 'left'       : '',
"  \ 'left_alt'   : '>',
"  \ 'dir_sep'    : ' / ',
"  \ 'truncation' : '...',
"  \ 'vcs_branch' : '',
"  \ 'space'      : ' '}

" tmuxline.vim
let g:tmuxline_theme = 'airline'
"let g:tmuxline_theme = 'nightly_fox'
let g:airline#extensions#tmuxline#enabled = 0
" TODO see how to configure/fix alert status on tmux window having
" notifications (like mutt window when there are new messages)
" #H    Hostname of local host
" #h    Hostname of local host without the domain name
" #F    Current window flag
" #I    Current window index
" #S    Session name
" #W    Current window name
" #(shell-command)  First line of the command's output
" Segments: a,b,c win/cwin x,y,z
" missing in bar
" - uptime
" - load
let g:tmuxline_preset = {
      \'a'    : '#S @ #h',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '%a %d %b %Y',
      \'z'    : '%R'}

" vim:set ft=vim et sw=2:
