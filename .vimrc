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
set mouse=v

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
set listchars=eol:¬,tab:▸\ ,trail:·
set copyindent
set breakindent

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" fzf
set rtp+=~/.fzf
let g:fzf_tags_command = 'ctag-gen'

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
let g:airline#extensions#ale#enabled=1
let airline#extensions#ale#error_symbol='🛑'
let airline#extensions#ale#warning_symbol='⚠️'
let airline#extensions#ale#open_lnum_symbo='📋'

" Ale
let g:ale_linters_ignore=['jshint']
let g:ale_typescript_eslint_executable='eslintl'
let g:ale_javascript_eslint_executable='eslintl'
let g:ale_open_list=1
let g:ale_lint_delay=0
let g:ale_set_highlights=0
let g:ale_list_window_size=5
let g:ale_lint_on_text_changed='never'
let g:ale_echo_msg_format='%s'
let g:ale_sign_error = '🛑'
let g:ale_sign_info = 'ℹ️'
let g:ale_sign_style_error = '🛑'
let g:ale_sign_style_warning = '⚠️'
let g:ale_sign_warning = '⚠️'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" netrw
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_winsize=25
let g:netrw_altv=1
let g:netrw_keepdir=0
let g:netrw_banner=0

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
vmap <C-c> "+y
map <Tab> :Lexplore<CR>
noremap <silent> <C-k> :call ALEToggleList()<CR>
map <C-p> :Files<CR>
map <C-a> :Ag<CR>
map <C-o> :Tags<CR>

" Fix backspace in insert mode
set backspace=indent,eol,start

" On startup
autocmd VimEnter * wincmd w

" Toggle ALE quick list
function! ALEToggleList()
	if exists("g:loclist")
		lclose
		unlet g:loclist
	else
		lopen 5
		let g:loclist = bufnr("$")
	endif
endfunction
