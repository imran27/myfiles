set nocompatible			" be iMproved, required
filetype off				" required

" set runtime path to include Vundle and initialize 
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"Plugin 'rust-lang/rust.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-flagship'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'phildawes/racer'
Plugin 'tpope/vim-sensible'
Plugin 'christoomey/vim-system-copy'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'Lokaltog/powerline'

" All of your Plugins must be added before the following line
call vundle#end()			" required

filetype on					" required
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
" set visualbell
set guifont=Source\ Code\ Pro\ 10
set guioptions=aegi
set nowrap
set relativenumber

" Set color scheme
colorscheme solarized

" Color schemes change the background to light very often, so make the
" background dark explicitly
set background=dark

set hidden
"let g:racer_cmd="~/Rust/Projects/racer/target/release/racer"

set laststatus=2
set showtabline=2

set tabline=%m%t
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

" vim-powerline
"let g:Powerline_theme='solarized256'
let g:Powerline_symbols='fancy'
let g:powerline_pycmd='py3'
"let g:Powerline_dividers_override=['>>','>','<<','<']

nmap <C-n> :NERDTreeToggle<CR>
