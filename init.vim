" Plugins
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'posva/vim-vue'

Plug 'vim-airline/vim-airline'

Plug 'moll/vim-bbye'

Plug 'vifm/vifm.vim'

Plug 'editorconfig/editorconfig-vim'
call plug#end()

" General
filetype plugin on
set shell=zsh\ -i
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
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set autoread

" Color and fonts
syntax enable
hi NonText ctermfg=7
hi SpecialKey ctermfg=7

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

" ALE
let g:ale_sign_error='🔴'
let g:ale_sign_info='🔵'
let g:ale_sign_warning='🟡'
highlight ALEError ctermbg=none cterm=underline
highlight ALEInfo ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
highlight clear ALEErrorSign
highlight clear ALEInfoSign
highlight clear ALEWarningSign
highlight clear SignColumn

" Coc
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ 'coc-phpls',
	\ 'coc-python',
	\ 'coc-pairs',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-vetur',
\ ]

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
" File movement
nmap <C-p> :Files<CR>
nmap <C-a> :Rg<CR>
nmap <Tab> :EditVifm<CR>
nmap <C-]> :call CocActionAsync('jumpDefinition', 'drop')<CR>
" Buffer
nmap gb :bp<CR>
nmap gn :bn<CR>
nmap cb :Bdelete<CR>
