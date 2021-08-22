if('g:vscode')
        "vsc
        nnoremap <A-j> :m .+1<CR>==
        nnoremap <A-k> :m .-2<CR>==
        inoremap <A-j> <Esc>:m .+1<CR>==gi
        inoremap <A-k> <Esc>:m .-2<CR>==gi
        vnoremap <A-j> :m '>+1<CR>gv=gv
        vnoremap <A-k> :m '<-2<CR>gv=gv
else
        "reg
        let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
        if empty(glob(data_dir . '/autoload/plug.vim'))
          silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
        set number " show line number
        filetype plugin indent on " turns on filetype detection and indentation
        set tabstop=2 "2 spaces per tab
        set softtabstop=2 "number of spaces in tab when editing
        set shiftwidth=2
        set expandtab " converts tabs to spaces
        set wildmenu " visual autocomplete
        set hidden
        let g:netrw_liststyle = 1
        
        " VimPlug
        call plug#begin()
          "Plug 'folke/tokyonight.nvim' 
          Plug 'sainnhe/everforest'
          Plug 'vim-airline/vim-airline'
          Plug 'vim-airline/vim-airline-themes'
          " Plug 'tpope/vim-vinegar'
          Plug 'preservim/nerdtree'
          Plug 'evanleck/vim-svelte', {'branch': 'main'}
          Plug 'nvim-lua/popup.nvim'
          Plug 'nvim-lua/plenary.nvim'
          Plug 'nvim-telescope/telescope.nvim'
          Plug 'tpope/vim-commentary'
          Plug 'eslint/eslint'
          Plug 'neovim/nvim-lspconfig'
          Plug 'nvim-lua/completion-nvim'
          "Plug 'windwp/nvim-autopairs'
          Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
          "Plug 'windwp/nvim-ts-autotag'
        call plug#end()
        
        "autopairs config
        " lua require('nvim-autopairs').setup()

        "lsp config
        lua require('lspconfig').tsserver.setup{on_attach=require'completion'.on_attach}
        lua require('lspconfig').svelte.setup{on_attach=require'completion'.on_attach}
        lua require('lspconfig').cssls.setup{on_attach=require'completion'.on_attach}
        lua require('lspconfig').hls.setup{on_attach=require'completion'.on_attach}
        lua require('lspconfig').html.setup{on_attach=require'completion'.on_attach}

        "treesitter config
        lua << EOF
          require('nvim-treesitter.configs').setup{
          autotag = {enable = true, disable ={}}, 
          highlight = {enable = true, disable = {}},
          indent = {enable = false, disable = {}},
          ensure_installed = {
            'tsx',
            'javascript',
            'typescript',
            'css',
            'html',
            'svelte',
            'json'
            }}
EOF

        "autocomplete config
        "Use <Tab> and <S-Tab> to navigate through popup menu
        inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
        "Set completeopt to have a better completion experience
        set completeopt=menuone,noinsert,noselect
        "Avoid showing message extra message when using completion
        set shortmess+=c

        "keymappings for moving text + indent
        nnoremap <A-j> :m .+1<CR>==
        nnoremap <A-k> :m .-2<CR>==
        inoremap <A-j> <Esc>:m .+1<CR>==gi
        inoremap <A-k> <Esc>:m .-2<CR>==gi
        vnoremap <A-j> :m '>+1<CR>gv=gv
        vnoremap <A-k> :m '<-2<CR>gv=gv

        "keymappings for telescope
        nnoremap <leader>ff <cmd>Telescope find_files<cr>
        nnoremap <leader>fg <cmd>Telescope live_grep<cr>
        nnoremap <leader>fb <cmd>Telescope buffers<cr>
        nnoremap <leader>fh <cmd>Telescope help_tags<cr>

        "keymapping + open on start for nerdtree
        nnoremap <leader>b :NERDTreeToggle<CR>
        autocmd VimEnter * NERDTree | wincmd p

        "colorscheme 
        "let g:tokyonight_style = "night"
        colorscheme everforest 
        if has('termguicolors')
          set termguicolors
        endif
        set background=dark
        let g:everforest_background = 'hard'
        highlight Comment cterm=italic gui=italic

        "airline 
        let g:airline#extensions#tabline#enabled = 1 "enable buffer display in airline
        let g:airline_powerline_fonts = 1
        let g:airline_theme = 'everforest' 

endif
