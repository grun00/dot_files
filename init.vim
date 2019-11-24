set rtp+=~/.fzf

call plug#begin('~/.local/share/nvim/plugged') 

"General 
Plug 'Yggdroot/indentLine' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs' 
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround' 
Plug 'vim-scripts/tComment' 
Plug 'vimwiki/vimwiki' 
Plug 'yuttie/comfortable-motion.vim'


"Ruby Plugs
Plug 'thoughtbot/vim-rspec' 
Plug 'tpope/vim-endwise' 

"JavaScript plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node' 
Plug 'pangloss/vim-javascript'

call plug#end()

" ================ General Config ====================

set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus 
set cmdheight=2
set expandtab 
set foldnestmax=5
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set linebreak  
set nobackup
set nofoldenable
set noswapfile
set nowb
set nowritebackup
set number relativenumber
set ruler
set scrolloff=5
set shiftwidth=2
set showcmd
set sidescroll=1
set sidescrolloff=15
set signcolumn=yes
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set updatetime=300

let mapleader=" "                       " Leader <space>
set timeout timeoutlen=1500 
filetype plugin on
filetype indent on


" ======================= Navigations, tabs, buffers, copy and custom commands

" Optminization for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 

" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"<Ctrl-m> redraws the screen and removes any search highlight
nnoremap <silent> <C-m> :nohl<CR><C-l>

" Navigation of lines
nnoremap  j gj
nnoremap  k gk
vnoremap  j gj
vnoremap  k gk

"Tab Navigation
nnoremap tj  :tabfirst<CR>
nnoremap tk  :tablast<CR>
nnoremap th :tabprev<Return>
nnoremap tl :tabnext<Return>
nnoremap tt  :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Split window and split navigation
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Buffer navigation
set wildcharm=<Tab>
set wildmenu
set wildmode=full
nnoremap <leader><Tab> :buffer<Space><Tab>
nnoremap <leader>bn :bn<Return>
nnoremap <leader>bp :bp<Return>
noremap <leader>d :bd<CR>
nnoremap <leader>ba :buffers<CR>:buffer<Space>

"For matching if/ends/do/ends/whatever blocks
runtime macros/matchit.vim 

"For copying between files
vmap <Leader>y "*y
nmap <Leader>p "*p 

" ` and ^ are kinda hard on my keyboard
nnoremap <leader>ç `
nnoremap ç ^
vnoremap ç ^

" Saving
nmap <leader>w :w!<enter>
nmap <leader>wq :wq!<cr> 

"Tmux General
let g:tmux_navigator_no_mappings = 1 
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

"Rspec 
let g:spec_runner_dispatcher = "VtrSendCommand! {command}" 
map <Leader>rt :call RunCurrentSpecFile()<CR>
map <Leader>rs :call RunNearestSpec()<CR>
map <Leader>rl :call RunLastSpec()<CR>
map <Leader>ra :call RunAllSpecs()<CR>

" Scrolling Faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Persistent Undos
set undodir=~/.configs/nvim/.backups
set undofile

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" <F6> Spell-check
map <F6> :set spell spelllang=en_us 

"Cursor 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q" 
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" For vim-powerline
set laststatus=2 
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

"For a better future
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" coc auto complete with <tab>
inoremap <silent><expr> <TAB> 
      \ pumvisible() ? "\<C-n>" : 
      \ <SID>check_back_space() ? "\<TAB>" : 
      \ coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" 

function! s:check_back_space() abort 
  let col = col('.') - 1 
  return !col || getline('.')[col - 1]  =~# '\s' 
endfunction

"comfortable-motion adjustments
let g:comfortable_motion_friction = 200.0 
let g:comfortable_motion_air_drag = 3.0
