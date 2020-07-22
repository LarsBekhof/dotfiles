" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'moll/vim-bbye'

Plug 'vifm/vifm.vim'
call plug#end()

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
set clipboard^=unnamedplus
set bufhidden=wipe
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set autoread
set nohidden

" Autocmd
autocmd BufWritePost *.ts,*.js,*.tsx,*.jsx,*.php silent! !ctags &

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
noremap <Right> <Nop>

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" ALE
let g:ale_sign_error='🛑'
let g:ale_sign_warning='⚠️'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight clear SignColumn

" Coc
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ 'coc-phpls',
	\ 'coc-python',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-pairs',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-vetur',
\ ]

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
" File movement
map <C-p> :Files<CR>
map <C-a> :Rg<CR>
map <Tab> :EditVifm<CR>
map <C-]> :call CocActionAsync('jumpDefinition', 'drop')<CR>
" Buffer
map gb :bp<CR>
map gn :bn<CR>
map cb :Bdelete<CR>
