set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set rtp+=~/.fzf
" ================ Plugins ================ 
call plug#begin('~/.vim/plugged') 
"General
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'pbrisbin/vim-mkdir'

"Ruby Plugs
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

call plug#end()
filetype plugin indent on    " required

" ================ General Config ====================

set paste
set number relativenumber               "Line numbers are good
set backspace=indent,eol,start          "Allow backspace in insert mode
set history=1000                        "Store lots of :cmdline history
set showcmd                             "Show incomplete cmds down the bottom
set showmode                            "Show current mode down the bottom
set gcr=a:blinkon0                      "Disable cursor blink
set visualbell                          "No sounds
set autoread                            "Reload files changed outside vim
set t_vb=                               "Remove Annoying Beep
set hidden                              " http://items.sjbach.com/319/configuring-vim-right
set ruler                               " Can always see where you are in file 
set incsearch                           " Find the next match as we type the search
set hlsearch                            " Highlight searches by default
set ignorecase                          " Ignore case when searching...
set smartcase                           " ...unless we type a capital
set scrolloff=5                         " Scrolling from 5 up/down
set sidescrolloff=15
set sidescroll=1
set foldnestmax=5                      "deepest fold is 5 levels
set nofoldenable                       "dont fold by default
set noswapfile
set nobackup
set nowb
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab 
set linebreak    "Wrap lines at convenient points
set gdefault

let mapleader=" "                       " Leader <space>
set timeout timeoutlen=1500 
syntax on                               "turn on syntax highlighting
filetype plugin on
filetype indent on

" ======================= Navigations, tabs, buffers, copy and custom commands

" Optminization for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] 
let g:ctrlp_show_hidden = 1

" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"<Ctrl-l> redraws the screen and removes any search highlight
nnoremap <silent> <C-l> :nohl<CR><C-l>

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
" set wildcharm=<Tab>
" set wildmenu
" set wildmode=full
" nnoremap <leader><Tab> :buffer<Space><Tab>
nnoremap <leader><Tab> :bn<Return>
nnoremap <leader><S-Tab> :bp<Return>
noremap <leader>d :bd<CR>
nnoremap <leader>ba :buffers<CR>:buffer<Space>

"For matching if/ends/do/ends/whatever blocks
runtime macros/matchit.vim

"For copying between files
vmap <Leader>y "*y
nmap <Leader>p "*p
"
"For copying to/from clipboard
vmap <Leader>c "+y
nmap <Leader>V "+p

" ` and ^ are kinda hard on my keyboard
nnoremap ç `

"Tmux General
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

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
set undodir=~/.vim/backups
set undofile

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

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

"FZF configs
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

"Open file in split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

"Open file in VSplit
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>

"Buffers searching
function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction 

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction 

nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>

if &diff
    syntax off
endif


