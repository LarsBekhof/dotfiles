" Start pathogen plugin manager
execute pathogen#infect()

" General
set history=1000
set lazyredraw
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set ttyfast
set undolevels=1000
set noswapfile
set scrolloff=3
set mouse=v
set t_vb=
set tm=500
set ttyfast
set undolevels=1000
set noswapfile
set scrolloff=3
set mouse=v
set clipboard^=unnamedplus
set bufhidden=wipe
set shellcmdflag=-ic
set noto

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
set rtp+=~/Code/apps/fzf
let g:fzf_tags_command='ctag-gen'

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
" let g:airline_theme='powerlineish'
let g:Powerline_symbols='fancy'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#ale#enabled=1
let airline#extensions#ale#error_symbol='🛑'
let airline#extensions#ale#warning_symbol='⚠️'
let airline#extensions#ale#open_lnum_symbol='📋'
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['netrw']

" Ale
let g:ale_linters_ignore=['jshint']
let g:ale_typescript_eslint_executable='esl'
let g:ale_javascript_eslint_executable='esl'
let g:ale_lint_delay=0
let g:ale_set_highlights=0
let g:ale_list_window_size=5
let g:ale_lint_on_text_changed='never'
let g:ale_echo_msg_format='%s'
let g:ale_sign_error = '🛑'
let g:ale_sign_style_error = '🛑'
let g:ale_sign_info = 'ℹ️'
let g:ale_sign_style_info = 'ℹ️'
let g:ale_sign_warning = '⚠️'
let g:ale_sign_style_warning = '⚠️'
highlight clear ALEErrorSign
highlight clear ALEInfoSign
highlight clear ALEWarningSign

" netrw
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_keepdir=1
let g:netrw_banner=0
let g:netrw_preview=1
let g:netrw_winsize=-35
let g:netrw_bufsettings='noma nomod nu nobl nowrap ro'
autocmd VimEnter * Lex
autocmd WinLeave NetrwTreeListing vertical res35

" Keybindings
map <F1> <Esc>
imap <F1> <Esc>
map <Tab> :Lex<CR>
map <silent> <C-k> :call ALEToggleList()<CR>
map <C-p> :Files<CR>
map <C-a> :Ag<CR>
map <C-l> :Buffers<CR>
map gn :bn<CR>
map gp :bp<CR>
map gd :bd<CR>
" Netrw bindings
autocmd FileType netrw noremap <buffer> gn <C-w>l:bn<CR>
autocmd FileType netrw noremap <buffer> gp <C-w>l:bp<CR>
autocmd FileType netrw noremap <buffer> gd :bd<CR>
" JavaScript bindings
autocmd FileType javascript map <buffer> <C-o>l oconsole.log();<Esc>F(
autocmd FileType javascript map <buffer> <C-o>L Oconsole.log();<Esc>F(
" TypeScript bindings
autocmd FileType typescript map <buffer> <C-o>l oconsole.log();<Esc>F(
autocmd FileType typescript map <buffer> <C-o>L Oconsole.log();<Esc>F(
" PHP bindings (actually some PHP but mostly Laravel)
autocmd FileType php map <buffer> <C-o>l oLog::debug();<Esc>F(
autocmd FileType php map <buffer> <C-o>L OLog::debug();<Esc>F(

" Commands
command! MakeTags !ctags-gen

" Fix backspace in insert mode
set backspace=indent,eol,start

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
