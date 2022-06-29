" Plugins
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'moll/vim-bbye'

Plug 'vifm/vifm.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'airblade/vim-gitgutter'

Plug 'tomtom/tcomment_vim'

Plug 'chrisbra/csv.vim'

Plug 'tpope/vim-fugitive'

Plug 'lifepillar/vim-gruvbox8'
call plug#end()

" General
filetype plugin on
let mapleader=","
set lazyredraw
set belloff=all
set ttyfast
set noswapfile
set scrolloff=3
set mouse=v
set clipboard^=unnamedplus
set bufhidden=wipe
set history=1000
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000
set autoread
set updatetime=100
set ignorecase
set smartcase

" Color and fonts
set background=dark
colorscheme gruvbox8_hard
let g:gruvbox_transp_bg=1
syntax enable
highlight clear SignColumn

" Interface
set number
set relativenumber
set wildmenu
set showmatch
set incsearch
set hlsearch

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
let g:airline_theme='base16_gruvbox_dark_hard'

" Git gutter
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" Coc
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ '@yaegassy/coc-intelephense',
	\ 'coc-python',
	\ 'coc-pairs',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-vetur',
	\ 'coc-eslint',
\ ]
highlight clear CocErrorSign
highlight clear CocWarningSign
highlight clear CocInfoSign
highlight clear CocHintSign

augroup postcss_ft
	au!
	autocmd BufNewFile,BufRead *.postcss   set syntax=css
augroup END

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
nmap <C-f> :CocFzfList actions<CR>
" File movement
nnoremap <C-p> :Files<CR>
nnoremap <C-a> :Rg<CR>
nnoremap <Tab> :EditVifm<CR>
nnoremap <C-]> :call CocActionAsync('jumpDefinition', 'drop')<CR>
" Buffer
nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap cb :Bdelete<CR>
nnoremap gs :vert sb%<CR>
