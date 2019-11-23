set clipboard+=unnamedplus 

set rtp+=~/.fzf
call plug#begin('~/.local/share/nvim/plugged') 

"General 
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs' 
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-surround' 
Plug 'vifm/vifm' 
Plug 'vim-scripts/tComment' 
Plug 'vimwiki/vimwiki' 
Plug 'yuttie/comfortable-motion.vim'
Plug 'Yggdroot/indentLine' 

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

set number relativenumber               
set backspace=indent,eol,start          "Allow backspace in insert mode
set history=1000
set showcmd                             "Show incomplete cmds down the bottom
set autoread                            "Reload files changed outside vim
set hidden                              " http://items.sjbach.com/319/configuring-vim-right
set ruler                               " Can always see where you are in file 
set incsearch                           " Find the next match as we type the search
set hlsearch                            " Highlight searches by default
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=15
set sidescroll=1
set foldnestmax=5
set nofoldenable
set noswapfile
set nobackup
set nowritebackup
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab 
set linebreak  
set gdefault
set cmdheight=2
set updatetime=300
set signcolumn=yes

" Optminization for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 

let mapleader=" "                       " Leader <space>
set timeout timeoutlen=1500 
filetype plugin on
filetype indent on

" ======================= Navigations, tabs, buffers, copy and custom commands

" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"<Ctrl-m> redraws the screen and removes any search highlight
nnoremap <silent> <C-m> :nohl<CR><C-l>

" Navigation of lines
nnoremap  k gk
nnoremap  j gj
vnoremap  k gk
vnoremap  j gj

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
      \ 'colorscheme': 'seoul256',
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
