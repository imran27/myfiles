set nocompatible			" be iMproved, required
filetype off				" required

call plug#begin()

" let Vundle manage Vundle, required
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'

Plug 'racer-rust/vim-racer'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'zeis/vim-kolor'
Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/a.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'jamessan/vim-gnupg'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/SyntaxRange'

Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'gerw/vim-latex-suite'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'

call plug#end()

filetype plugin indent on	" required

syntax on

set encoding=utf-8
set fileencoding=utf-8

set tabstop=4
set shiftwidth=4
set noexpandtab
set backspace=indent,eol,start
set autoindent
set smartindent

"set incsearch
set hlsearch
"set ignorecase

set number
set smartcase
set foldmethod=syntax
set showmatch
set cursorline
"set visualbell
set guifont=Inconsolata-g\ for\ Powerline\ 10
set guioptions=agi
"set nowrap
set relativenumber

set t_Co=256

" Set color scheme
colorscheme kolor

" Color schemes change the background to light very often, so make the
" background dark explicitly
set background=dark

set hidden
"let g:racer_cmd="/usr/bin/racer"
"let $RUST_SRC_PATH="${RUST_SRC_PATH}"

set laststatus=2
set showtabline=2

"set tabline=%m%t
"set guitablabel=%m%t
"set statusline=%m[%f]\:%y

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

"let g:rustfm_autosave=1
"let g:rust_conceal=1
"let g:rust_conceal_mod_path=1
"let g:rust_conceal_pub=1
"let g:rust_recommended_style=1
"let g:rust_fold=1
"let g:rust_bang_comment_leader=1
"let g:ftplugin_rust_source_path=$RUST_SRC_PATH

" vim-mustache-handlebars
let g:mustache_abbreviations=1

" vim-powerline
"let g:Powerline_theme='solarized256'
let g:Powerline_symbols='fancy'
let g:powerline_pycmd='py3'
"let g:Powerline_dividers_override=['>>','>','<<','<']

" vim-airline stuff
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='murmur'

" vim-latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

" auto-pairs
let g:AutoPairsFlyMode=1

nmap <C-n> :NERDTreeToggle<CR>

