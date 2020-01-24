set encoding=utf-8
set rtp+=~/.fzf

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
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
Plug 'vim-scripts/VisIncr'
Plug 'tpope/vim-dispatch'
Plug 'alvan/vim-closetag'
Plug 'idanarye/vim-merginal'
Plug 'chrisbra/csv.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'bagrat/vim-buffet'

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
set history=10000
set hlsearch
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
nnoremap , @@
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
"colorscheme solarized


" ======================= Navigations, tabs, buffers, copy and custom commands

"For a better Future
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"<Ctrl-l> redraws the screen and removes any search highlight
nnoremap <silent> <leader>l :nohl<CR><C-l>

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
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l

" Buffer navigation
nnoremap <leader><Tab> :bn<Return>
"nnoremap <leader><S-Tab> :bp<Return>
noremap <leader>d :Bclose<CR>
nnoremap <leader>ba :buffers<CR>:buffer<Space>

"For matching if/ends/do/ends/whatever blocks
runtime macros/matchit.vim

"For copying between files
vmap <leader>y "*y
nmap <leader>p "*p

"So removing text doesn't kill my clipboard
nnoremap c "_c
nnoremap C "_C

" ` is kinda hard on my keyboard
nnoremap ç `

" Substitute for vim-rspec
nmap <silent> <leader>rs :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>
let g:test#strategy = "dispatch"
let g:neoterm_shell = '$SHELL -l'
tmap <leader>o <C-\><C-n>


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
      \ 'enable': {
      \   'tabline': 0
      \ }
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
nnoremap <silent> <Leader>S :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

"Open file in VSplit
nnoremap <silent> <Leader>V :call fzf#run({
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
"let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
nnoremap <leader>ç :Vexplore<CR>
"Nerdtree
map <C-n> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('ru', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('lock', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ff00ff', '#151515')

" Resizing panes
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader>< <C-w><<CR>
nnoremap <leader>> <C-w>><CR>

"Vim Fugitive
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Gllog<CR>
nnoremap <leader>gm :Gmerge
nnoremap <leader>gps :Gpush
nnoremap <leader>gpl :Gpull
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gcb :Merginal<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <leader>z :ZoomToggle<CR>

" HTML autocomplete
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb'

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
  finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
  let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
  if empty(a:buffer)
    let btarget = bufnr('%')
  elseif a:buffer =~ '^\d\+$'
    let btarget = bufnr(str2nr(a:buffer))
  else
    let btarget = bufnr(a:buffer)
  endif
  if btarget < 0
    call s:Warn('No matching buffer for '.a:buffer)
    return
  endif
  if empty(a:bang) && getbufvar(btarget, '&modified')
    call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
    return
  endif
  " Numbers of windows that view target buffer which we will delete.
  let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
  if !g:bclose_multiple && len(wnums) > 1
    call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
    return
  endif
  let wcurrent = winnr()
  for w in wnums
    execute w.'wincmd w'
    let prevbuf = bufnr('#')
    if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
      buffer #
    else
      bprevious
    endif
    if btarget == bufnr('%')
      " Numbers of listed buffers which are not the target to be deleted.
      let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
      " Listed, not target, and not displayed.
      let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
      " Take the first buffer, if any (could be more intelligent).
      let bjump = (bhidden + blisted + [-1])[0]
      if bjump > 0
        execute 'buffer '.bjump
      else
        execute 'enew'.a:bang
      endif
    endif
  endfor
  execute 'bdelete'.a:bang.' '.btarget
  execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
nnoremap <silent> <Leader>bd :Bclose<CR>

"Markdown
let g:mkdp_browser = 'firefox'

"buffet
let g:buffet_show_index = 1
let g:buffet_max_plug = 10
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf004"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
