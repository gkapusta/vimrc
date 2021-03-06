set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
    "For Win32 GUI remove 't' flag from 'guioptions': no tearoff menu entries
    let &guioptions = substitute(&guioptions, "t", "", "g")
    au GUIEnter * simalt ~x
endif

" Use bundles config
if filereadable(expand("~/.vim/.vimrc.bundles"))
    source ~/.vim/.vimrc.bundles
endif

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
set guioptions-=T

let mapleader = ','

let g:molokai_original = 1
colorscheme molokai
if has('win32') || has('win64')
    set guifont=Consolas:h10:cANSI
elseif has('gui_gtk2')
    set guifont=Ubuntu\ Mono\ 11
endif

if has('gui_macvim')
    autocmd VimLeave * macaction terminate:
endif

" Plugins {
    " javascript {
        let g:html_indent_inctags = "html,body,head,tbody"
        let g:html_indent_script1 = "inc"
        let g:html_indent_style1 = "inc"
    " }
    
    " NeoComplCache {
        let g:acp_enableAtStartup = 0
        let g:neocomplcache_enable_at_startup = 1
        let g:neocomplcache_enable_smart_case = 1
        let g:neocomplcache_enable_camel_case_completion = 1
        let g:neocomplcache_enable_underbar_completion = 1
        let g:neocomplcache_enable_auto_delimiter = 1
        let g:neocomplcache_min_syntax_length = 3
        let g:neocomplcache_max_list = 15

        " Define file-type dependent dictionaries.
        let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ }

        " Define keyword, for minor languages
        if !exists('g:neocomplcache_keyword_patterns')
          let g:neocomplcache_keyword_patterns = {}
        endif
        let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

        " Plugin key-mappings.
        inoremap <expr><C-g>     neocomplcache#undo_completion()
        inoremap <expr><C-l>     neocomplcache#complete_common_string()

        " <CR>: close popup and save indent.
        inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        " <C-h>: close popup and delete backword char.
        inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
        inoremap <expr><C-e>  neocomplcache#cancel_popup()

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " Enable heavy omni completion. 
        if !exists('g:neocomplcache_omni_patterns')
          let g:neocomplcache_omni_patterns = {}
        endif
        let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
        let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
        let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
    " }

    " NerdTree {
        map <C-d> :NERDTreeToggle<CR>
        nmap <leader>d :NERDTreeToggle<CR>
        nmap <leader>f :NERDTreeFind<CR>

        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:NERDSpaceDelims=1
        let g:nerdtree_tabs_open_on_gui_startup=0
    " }
    
    " ctrlp {
        nmap <leader>p :CtrlP<CR>
        nmap <leader>b :CtrlPBuffer<CR>
        nmap <leader>P :CtrlPClearCache<CR>:CtrlP<CR>
        
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_switch_buffer = 'et'
    " }
    
    " Use The Silver Searcher https://github.com/ggreer/the_silver_searcher {
        if executable('ag')
            let g:ackprg = 'ag --nogroup --column'

            " Use Ag over Grep
            set grepprg=ag\ --nogroup\ --nocolor

            " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        endif
    " }
" }

