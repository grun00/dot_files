set encoding=utf-8
set rtp+=~/.fzf

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

"For matching if/ends/do/ends/whatever blocks
runtime macros/matchit.vim

call plug#begin('~/.local/share/nvim/plugged')
Plug 'skanehira/preview-markdown.vim'
Plug 'bluz71/vim-moonfly-colors'
Plug 'hachy/eva01.vim'
Plug 'xavierchow/vim-swagger-preview'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'rainerborene/vim-reek'
Plug 'tpope/vim-rhubarb'
Plug 'AndrewRadev/switch.vim'
Plug 'camspiers/animate.vim'
Plug 'tpope/vim-eunuch'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'gko/vim-coloresque'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'junegunn/gv.vim'
Plug 'chrisbra/csv.vim'
Plug 'mhinz/vim-signify'
Plug 'ellisonleao/glow.nvim'
Plug 'nikvdp/neomux'
Plug 'idanarye/vim-merginal'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tree-sitter/tree-sitter-go'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'luukvbaal/stabilize.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'yuttie/comfortable-motion.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-lsp'
Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
Plug 'mhartington/formatter.nvim'
Plug 'rebelot/kanagawa.nvim'
Plug 'matsuuu/pinkmare'
Plug 'NLKNguyen/papercolor-theme'
let g:AutoPairsMapCR=0
let g:deoplete#enable_at_startup = 1
" <TAB>: completion with deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Colors
"Not Programming
Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'f1nwe/neovim-molokai'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()


" ================ General Config ====================

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set clipboard+=unnamedplus
set cmdheight=2
set completeopt=menuone,noinsert,noselect
set diffopt+=vertical
set expandtab
set fillchars+=vert:│
set foldnestmax=5
set gdefault
set hidden
set history=10000
set hlsearch
set inccommand=split
set incsearch
set laststatus=2
set linebreak
set list listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set nobackup
set nofoldenable
set noswapfile
set nowb
set nowritebackup
set number relativenumber
set ruler
set scrolloff=100
set shiftwidth=2
set shortmess+=c
set showcmd
set sidescroll=1
set sidescrolloff=15
set signcolumn=yes
set smartindent
set smarttab
set softtabstop=2
set t_Co=256
set tabstop=2
set termguicolors
set timeout timeoutlen=1500
set undodir=~/.config/nvim/.backups
set undofile
set updatetime=300
colorscheme eva01
filetype indent on
filetype plugin on
syntax on

if !has('gui_running')
  set t_Co=256
endif
highlight Cursor guifg=magenta guibg=white
highlight iCursor guifg=green guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" =========== generic remaps
" Leader key is <space>
let mapleader=" "
" For repeating macros
nnoremap , @@
"<leader-l> redraws the screen and removes any search highlight
nnoremap <silent> <leader>l :nohl<CR><C-l>

" ========== git remaps
" git diff
if &diff
  map <leader>1 :diffget LOCAL<CR>
  map <leader>2 :diffget BASE<CR>
  map <leader>3 :diffget REMOTE<CR>
endif

"Vim fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gps :Git push origin HEAD<CR>
nnoremap <leader>gpl :Git pull origin HEAD<CR>
nnoremap <leader>gbr :GBranch<CR>
nnoremap <leader>gn :Merginal<CR>

" =========== generic autocmds
" Automatically deletes all trailing whitespace on save.
au BufWritePre * %s/\s\+$//e
" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "
au CursorHold * lua vim.diagnostic.open_float()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

call deoplete#custom#source('_', 'max_menu_width', 80)

lua << EOF
  require("statusline")
EOF

nmap <unique> <leader>e <Plug>GenerateDiagram
