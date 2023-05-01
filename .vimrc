" defaults
syntax on
set smartindent
filetype plugin indent on
set number
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab

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
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" ALE setup
let g:ale_linters = {
    \'rust': ['analyzer'], 
    \'proto': ['buf-lint']
    \}
let g:ale_completion_enabled = 1
let g:rustfmt_autosave = 1

" colors
if (has("termguicolors"))
    set termguicolors
endif
let g:gruvbox_transparent_bg = '1'
autocmd vimenter * ++nested colorscheme gruvbox

" custom mappings
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

command B Buffers
command F Files
