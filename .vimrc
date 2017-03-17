" Start pathogen plugin manager
execute pathogen#infect()

" General
set history=1000
set lazyredraw

" Color and fonts
syntax enable
set t_Co=256

" Interface
set relativenumber
set wildmenu
set showmatch
set incsearch
set hlsearch
set laststatus=2

" Text, tab and indent
set tabstop=4
set softtabstop=4

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = {}

" Airline
let g:airline_powerline_fonts=1
