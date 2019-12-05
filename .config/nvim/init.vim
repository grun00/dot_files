set encoding=utf-8
set rtp+=~/.fzf

call plug#begin('~/.local/share/nvim/plugged')

"General
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim' 
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pbrisbin/vim-mkdir'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'vimwiki/vimwiki'
Plug 'yuttie/comfortable-motion.vim' 
Plug 'easymotion/vim-easymotion'

"Colors 
Plug 'morhetz/gruvbox'

"Ruby Plugs
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'

"JavaScript plugins
Plug 'editorconfig/editorconfig-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'moll/vim-node'
Plug 'pangloss/vim-javascript'

"Not Programming
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

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
colorscheme gruvbox



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
nnoremap <leader>ç `
nnoremap ç ^
vnoremap ç ^

" Saving
nmap <leader>w :w!<enter>
nmap <leader>wq :wq!<cr>

"Tmux General
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

" Substitute for vim-rspec
nmap <silent> <Leader>rs :TestNearest<CR>
nmap <silent> <Leader>rf :TestFile<CR>
nmap <silent> <Leader>ra :TestSuite<CR>
nmap <silent> <Leader>rl :TestLast<CR>
nmap <silent> <Leader>rt :TestVisit<CR>
let test#neovim#term_position = "leftabove"

" Scrolling Faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Persistent Undos
set undodir=~/.config/nvim/.backups
set undofile

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:·
set list listchars=tab:»·,trail:·,nbsp:·

" <F6> Spell-check
map <F6> :set spell spelllang=en_us
map <F7> :set spell spelllang=pt

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

" create <%= foo %> erb tags using Ctrl-k in edit mode
imap <silent> <C-L> <%=  %><Esc>2hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
imap <silent> <C-H> <%  %><Esc>2hi

"For a better Future
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Always use vertical diffs
set diffopt+=vertical

"For Goyo/Limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <Leader>gy :Goyo<CR>

"Compatibility with vim-latex
let g:vimtex_compiler_progname = 'nvr'

