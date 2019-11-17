" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim


" ================ Plugins ================ 
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'jiangmiao/auto-pairs'
Plugin 'file:///home/grun/.vimpkg/bundle/vim-signature'
Plugin 'file:///home/grun/.vimpkg/bundle/YouCompleteMe'

Plugin 'tpope/vim-endwise' 
Plugin 'tpope/vim-fugitive' 
Plugin 'tpope/vim-surround'

Plugin 'kien/ctrlp.vim'

Plugin 'Yggdroot/indentLine'

Plugin 'thoughtbot/vim-rspec'

Plugin 'vim-scripts/tComment'

Plugin 'itchyny/lightline.vim'


call vundle#end()            " required
filetype plugin indent on    " required

" ================ General Config ====================
set number relativenumber                     "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set t_vb=                       "Remove Annoying Beep
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=" "
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
endif

" ================ Folds ============================

"set foldmethod=indent   "fold based on indent
set foldnestmax=5      "deepest fold is 5 levels
set nofoldenable        "dont fold by default

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" ================ Custom Settings ========================

runtime macros/matchit.vim 

"For copying between files
map <Leader>y "*y
map <Leader>p "*p
map <Leader>d "*d
"Copy Paste with <Leader-c> <Leader-v>
vmap <Leader>c "+y     " Yank current selection into system clipboard
nmap <Leader>v "+Y     " Yank current line into system clipboard (if nothing is selected)
nmap <Leaver>v "+p     " Paste from system clipboard

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let g:spec_runner_dispatcher = "VtrSendCommand! {command}"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" For Running plain Ruby test scripts
"nnoremap <leader>r :RunSpec<CR>
"nnoremap <leader>l :RunSpecLine<CR>
"nnoremap <leader>e :RunSpecLastRun<CR>
"nnoremap <leader>cr :RunSpecCloseResult<CR>

" For ruby block selections
runtime macros/matchit.vim

" <Ctrl-l> redraws the screen and removes any search highlight.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" <F6> Spell-check
map <F6> :set spell spelllang=en_us

" Navigation of lines
nnoremap  k gk
nnoremap  j gj
vnoremap  k gk
vnoremap  j gj

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

"Tab Navigation
nnoremap tk  :tabfirst<CR>
nnoremap tl  :tabnext<CR>
nnoremap th  :tabprev<CR>
nnoremap tj  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
"Always new tab
autocmd VimEnter * tab all
autocmd BufAdd * exe 'tablast | tabe "' . expand( "<afile") .'"'

