" General
set history=1000
set lazyredraw
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt-=preview
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ttyfast
set noswapfile
set scrolloff=3
set mouse=v
set t_vb=
set tm=500
set ttyfast
set noswapfile
set scrolloff=3
set mouse=v
set clipboard^=unnamedplus
set bufhidden=wipe
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set autoread

" Autocmd
autocmd BufWritePost *.ts,*.js,*.tsx,*.jsx,*.php silent! !ctags &
autocmd VimEnter * :Vexplore

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
set list
set listchars=tab:▸\ ,trail:·
set copyindent
set breakindent

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>

" Netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_liststyle=3

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
