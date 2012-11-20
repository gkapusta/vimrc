set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" ================ General Config ====================
set backspace=indent,eol,start "Allow backspace in insert mode
set showcmd                    "Show incomplete commands at the bottom
set cmdheight=2
set showmode                   "Show current mode
set autoread                   "Reload files changed outside vim
set hidden                     "http://items.sjbach.com/319/configuring-vim-right
set history=1000               "Store :cmdline history
set visualbell                 "No sounds
set noerrorbells
set number                     "Line numbers
set ruler
set mouse=a
set fileformats=unix,dos,mac
set showmatch
set foldenable
set foldmethod=indent
set foldlevel=100

"Turn on  syntax highlighting
syntax on
filetype on
filetype plugin on
filetype indent on

" ================ Indentation ======================
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set smarttab
set expandtab

set nowrap
set linebreak

" ================ Turn Off Swap Files ==============
set nobackup
set nowritebackup
set noswapfile

" ================ Search settings ====================
set incsearch
set hlsearch
set ignorecase
set smartcase

" ================ Completion =======================
set wildmenu
set wildmode=list:longest

" ================ Scrolling ========================
set scrolloff=5         "Start scrolling when we're n lines away from margins
set sidescrolloff=5
set sidescroll=1

set guioptions+=b      "Show horizontal scrollbar

"

"For Win32 GUI remove 't' flag from 'guioptions': no tearoff menu entries
let &guioptions = substitute(&guioptions, "t", "", "g")

au GUIEnter * simalt ~x

colorscheme desert

set guifont=Consolas:h10:cANSI

