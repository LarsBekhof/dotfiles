" Plugins
call plug#begin()
" Install FZF so nvim can use it
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
" Adds commands and shortcuts for FZF
Plug 'junegunn/fzf.vim'
" Auto completion for installed languages (see g:coc_global_extensions for installed languages)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use FZF for COC autocompletion
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Provides syntax highlighting and indentation for all languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSInstall all'}
Plug 'findango/vim-mdx'

" Provides file information at the bottom of the screen
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Removes hidden buffers
Plug 'moll/vim-bbye'

" Open Vifm file manager in nvim
Plug 'Vifm/vifm.vim'

" Make vim honour editorconfig settings
Plug 'editorconfig/editorconfig-vim'

" See get changes in the nvim gutter
Plug 'airblade/vim-gitgutter'

" Comment and uncomment code
Plug 'tomtom/tcomment_vim'

" Provides git functionality in nvim
Plug 'tpope/vim-fugitive'

" A nice gruvbox theme
Plug 'ellisonleao/gruvbox.nvim'
call plug#end()

" General
filetype plugin on
let mapleader=" "
set lazyredraw
set belloff=all
set ttyfast
set noswapfile
set scrolloff=3
set mouse=v
set clipboard+=unnamedplus
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
set shell=zsh

" Color and fonts
set background=dark
colorscheme gruvbox
syntax enable
highlight clear SignColumn
autocmd VimEnter * hi Normal ctermbg=none

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
setlocal autoindent

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='base16_gruvbox_dark_hard'

" Fzf
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['up,50%,nohidden', 'ctrl-/']

" Git gutter
highlight GitGutterAdd ctermfg=2
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" COC
let g:coc_global_extensions = [
	\ 'coc-json',
	\ 'coc-tsserver',
	\ '@yaegassy/coc-intelephense',
	\ 'coc-python',
	\ 'coc-pairs',
	\ 'coc-css',
	\ 'coc-html',
	\ 'coc-eslint',
	\ 'coc-rust-analyzer',
	\ 'coc-go',
	\ '@yaegassy/coc-volar',
	\ 'coc-spell-checker',
	\ 'coc-vimlsp',
\ ]
highlight clear CocErrorSign
highlight clear CocWarningSign
highlight clear CocInfoSign
highlight clear CocHintSign

" Colorscheme
lua << EOF
require("gruvbox").setup {
	transparent_mode = true,
}
vim.cmd("colorscheme gruvbox")
EOF

" tree-sitter
lua << EOF
require'nvim-treesitter.configs'.setup {
	auto_install = true,
	indent = { enable = true },
	highlight = { enable = true },
}
EOF

augroup postcss_ft
	au!
	autocmd BufNewFile,BufRead *.postcss   set syntax=css
augroup END

" Commands
command! -nargs=1 Phpunit execute("!" . getcwd() . "/vendor/bin/phpunit -- " . <f-args>)
command! Cp execute("!echo % | xclip -selection c")

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
nmap <Leader>f <Plug>(coc-codeaction-selected)l
" File movement
nnoremap <C-p> :Files<CR>
nnoremap <C-a> :Rg<CR>
nnoremap <Tab> :EditVifm<CR>
nnoremap <C-]> :call CocActionAsync('jumpDefinition', 'drop')<CR>
nnoremap <Leader>p :Buffers<CR>
" Buffer
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>d :Bdelete<CR>
nnoremap <Leader>s :vert sb%<CR>
