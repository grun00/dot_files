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

Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-endwise'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
filetype plugin indent on
let g:deoplete#enable_at_startup = 1
" ================ General Config ====================

set paste
set number relativenumber
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread
set t_vb=
set hidden
set ruler
set incsearch
set hlsearch
set ignorecase
set smartcase
set scrolloff=5
set sidescrolloff=15
set sidescroll=1
set foldnestmax=5
set nofoldenable
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
set linebreak
set gdefault

let mapleader=" "
set timeout timeoutlen=1500
syntax on
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

" Go commands
nnoremap <leader>gt :GoTestFunc<CR>
nnoremap <leader>ga :GoTest<CR>
nnoremap <leader>gr :GoRun<CR>
