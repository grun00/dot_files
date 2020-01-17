set encoding=utf-8
set rtp+=~/.fzf

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.local/share/nvim/plugged')

"General
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails' 
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'yuttie/comfortable-motion.vim' 

"Colors
Plug 'morhetz/gruvbox' 
Plug 'altercation/vim-colors-solarized'

"Not Programming
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'

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

let mapleader=" "
set timeout timeoutlen=1500
filetype plugin on
filetype indent on

"Color 
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:gruvbox_italic=1
"Type of Background
set background=dark
"set background=light

"Colorschemes
"colorscheme gruvbox
colorscheme solarized


" ======================= Navigations, tabs, buffers, copy and custom commands

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
nnoremap tk  :tabfirst<CR>
nnoremap tj  :tablast<CR>
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

" ` is kinda hard on my keyboard
nnoremap ç `

" Substitute for vim-rspec
nmap <silent> <Leader>rs :TestNearest<CR>
nmap <silent> <Leader>rf :TestFile<CR>
nmap <silent> <Leader>ra :TestSuite<CR>
nmap <silent> <Leader>rl :TestLast<CR>
nmap <silent> <Leader>rt :TestVisit<CR>
let g:test#strategy = "neovim"
let g:neoterm_shell = '$SHELL -l'
let g:neoterm_keep_term_open = 0
let g:neoterm_autoscroll = 1
tmap <leader>o <C-\><C-n>
let test#neovim#term_position = "vert topleft"


" Scrolling Faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Persistent Undos
set undodir=~/.config/nvim/.backups
set undofile

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·
set list listchars=tab:»·,trail:·,nbsp:·

"Spell-check
map <F6> :set spell spelllang=en_us
map <F7> :set spell spelllang=pt
map <F8> :set spell spelllang=de

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

"comfortable-motion adjustments
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 3.0

"System Clipboard Access
let g:clipboard = {
  \   'name': 'xclip',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

"FZF configs
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
nnoremap <C-p> :Files<Cr>
nnoremap <C-s> :Rg<Cr>

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

" Always use vertical diffs
set diffopt+=vertical

"For Goyo/Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <Leader>gy :Goyo<CR>

"Ale configs
packloadall
silent! helptags ALL

"file system
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
nnoremap <leader>ç :Vexplore<CR>

"For a better Future
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Resizing panes
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>< <C-w><<CR>
nnoremap <leader>> <C-w><<CR>

"Vim Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>gP :Gpull<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gd :Gdiff<CR>
