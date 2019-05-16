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
set tabstop=2
set softtabstop=2
set smartindent
set shiftwidth=2
" set expandtab
set list
" set listchars=tab:▸\ ,eol:¬,trail:·
set listchars=eol:¬,tab:▸\ ,trail:·
set copyindent
set breakindent

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" NERDTree
set modifiable
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=35

" ctrp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>

" On startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd BufWinEnter * NERDTreeMirror
