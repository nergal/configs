colorscheme earendel
set background=dark
if &term == 'screen'
   "let &t_SI = '[4h'
   "let &t_EI = '[4l'
elseif &term == 'rxvt-256color'
   "let &t_SI = ']12;orange'
   "let &t_EI = ']12;green'
endif

scriptencoding utf-8
set encoding=utf-8

set backspace=indent,eol,start

" set backup



set tabstop=4
set shiftwidth=4
set smarttab
set et

set number
syntax on

set wrap
set ai
set cin

set showmatch 
set hlsearch
set incsearch
set ignorecase
set smartcase

set autoindent
set smartindent
inoremap # X<BS>#

set lz

set listchars=tab:··
set list

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

if !has('gui_running')
    set mouse= 
endif

set guioptions-=T 
set guioptions-=m 

inoremap <silent> <C-u> <ESC>u:set paste<CR>.:set nopaste<CR>gi

if has('gui')
    colorscheme darkblue 
    if has('win32')
        set guifont=Lucida_Console:h12:cRUSSIAN::
    else
        set guifont=Terminus\ 14
    endif
endif

if has('gui')
    if has('win32')
        au GUIEnter * call libcallnr('maximize', 'Maximize', 1)
    elseif has('gui_gtk2')
        au GUIEnter * :set lines=99999 columns=99999
    endif
endif

if has('win32')
    set makeprg=nmake
    compiler msvc
else
    set makeprg=make
    compiler gcc
endif

set statusline=%F%m%r%h%w\ [Формат=%{&ff}]\ [Тип=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [Позиция=%04l,%04v][%p%%]\ [Длина=%L]
set laststatus=2 " always show the status line

set wildmenu

set clipboard+=unnamed

" set foldmethod=syntax
" set foldcolumn=3

set cursorline 
" set cursorcolumn

set ruler

