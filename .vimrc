" defaults
syntax on
filetype plugin indent on
set number
set encoding=utf-8

" cursor 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" vim-plug install
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
	  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" ALE setup
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_completion_enabled = 1
