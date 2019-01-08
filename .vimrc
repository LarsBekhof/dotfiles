" Start pathogen plugin manager
execute pathogen#infect()

" General
set history=1000
set lazyredraw
filetype plugin on
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ttyfast
set undolevels=1000
set noswapfile

" Color and fonts
syntax enable
set t_Co=256
hi NonText ctermfg=7
hi SpecialKey ctermfg=7

" Interface
set number
set relativenumber
set wildmenu
set showmatch
set incsearch
set hlsearch
set laststatus=2
set showcmd

" Text, tab and indent
set tabstop=4
set softtabstop=4
set smartindent
set shiftwidth=4
set expandtab
set list
set listchars=tab:▸\ ,eol:¬
set copyindent

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_quiet_messages={}
let g:syntastic_loc_list_height=3

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" On startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
