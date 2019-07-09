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
set scrolloff=3
set ignorecase

" Color and fonts
syntax enable
set t_Co=256
hi NonText ctermfg=7
hi SpecialKey ctermfg=7
colo darkblue

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
" set listchars=tab:▸\ ,eol:¬,trail:·
set listchars=eol:¬,tab:▸\ ,trail:·
set copyindent
set breakindent

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" NERDTree
set modifiable
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeWinSize=45

" fzf
set rtp+=~/.fzf
let g:fzf_tags_command = 'ctag-gen'

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=0
" let g:syntastic_loc_list_height=5

" let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_javascript_eslint_exe = 'eslintl'
" let g:syntastic_typescript_checkers=['eslint']
" let g:syntastic_typescript_eslint_exe = 'eslintl'

" Signify
let g:signify_vcs_list = ['git']
highlight DiffAdd ctermfg=2 ctermbg=0
highlight DiffChange ctermfg=3 ctermbg=0
highlight DiffDelete ctermfg=1 ctermbg=0
highlight clear SignColumn

" Airline
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections=1
let g:airline_theme='powerlineish'
let g:Powerline_symbols='fancy'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_close_button=0

" Ale
let g:ale_linters_ignore=['jshint']
let g:ale_typescript_eslint_executable='eslintl'
let g:ale_javascript_eslint_executable='eslintl'

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
vmap <C-c> "+y
map <Tab> :NERDTreeToggle<CR>
map <C-k> :Runcmd eslintl #<CR>
map <C-p> :Files<CR>
map <C-a> :Ag<CR>
map <C-o> :Tags<CR>

" Fix backspace in insert mode
set backspace=indent,eol,start

" On startup
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd w
autocmd BufWinEnter * NERDTreeMirror

fun! Runcmd(cmd)
	silent! exe "noautocmd botright pedit ".a:cmd
	noautocmd wincmd P
	set buftype=nofile
	exe "noautocmd r! ".a:cmd
	noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")
