set encoding=utf-8
set rtp+=~/.fzf

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

source ~/.config/nvim/configs/fzf.vim

"For matching if/ends/do/ends/whatever blocks
runtime macros/matchit.vim

call plug#begin('~/.local/share/nvim/plugged')
"General
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'tpope/vim-eunuch'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'alvan/vim-closetag'
Plug 'junegunn/gv.vim'
Plug 'chrisbra/csv.vim'
Plug 'mhinz/vim-signify'
Plug 'dense-analysis/ale'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'idanarye/vim-merginal'
Plug 'itchyny/lightline.vim'
Plug 'janko/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/VisIncr'
Plug 'vim-scripts/tComment'
Plug 'yuttie/comfortable-motion.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'camspiers/animate.vim'
Plug 'chrisbra/csv.vim'
"Deoplete & Snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" <TAB>: completion with deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Colors
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'chuling/equinusocio-material.vim'
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
set scrolloff=100
set shiftwidth=2
set showcmd
set sidescroll=1
set sidescrolloff=15
set signcolumn=yes
set ignorecase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set updatetime=300
set list listchars=tab:»·,trail:·,nbsp:·
set undodir=~/.config/nvim/.backups
set diffopt+=vertical
set undofile
set inccommand=split

" Leader key is <space>
let mapleader=" "
" For repeating macros
nnoremap , @@
set timeout timeoutlen=1500
filetype plugin on
filetype indent on

"Color
syntax on
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"let g:equinusocio_material_style = 'pure'
set fillchars+=vert:│
"Colorschemes
colorscheme gruvbox
"colorscheme equinusocio_material

" Buffer navigation
nnoremap <leader><Tab> :bn<Return>
noremap <leader>d :Bclose<CR>
"<Ctrl-l> redraws the screen and removes any search highlight
nnoremap <silent> <leader>l :nohl<CR><C-l>

"Vim Fugitive
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>go :Gllog<CR>
nnoremap <leader>gi :Gread<CR>
nnoremap <leader>gm :Gmerge
nnoremap <leader>gps :Gpush origin HEAD<CR>
nnoremap <leader>gpl :Gpull
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gcb :Merginal<CR>
nnoremap <leader>gr :G<CR>
nnoremap <leader>gt :GV<CR>

" Misc Functions
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
" XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
" Signify
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
let g:vim_markdown_conceal = 0
"Rainbow settings
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"Markdown
let g:mkdp_browser = 'chromium'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_toggle=2
highlight Normal guibg=none
highlight NonText guibg=none
"Ale configs
packloadall
silent! helptags ALL
" HTML autocomplete
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.erb'
" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
" For vim-powerline
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'equinusocio_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'enable': {
      \   'tabline': 0
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"Terminal NeoTerm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_automap_keys = ',tt'
let g:neoterm_autoinsert = 1
" vim-test
let g:test#strategy = "neovim"
let g:neoterm_keep_term_open = 0
let g:neoterm_autoscroll = 1
let test#neovim#term_position = "vert topleft"
let g:neoterm_shell = '$SHELL -l'
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
" just as it sounds
augroup highlightYankedText
    autocmd!
    autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
augroup END
" Navigation of lines
nnoremap  j gj
nnoremap  k gk
vnoremap  j gj
vnoremap  k gk
"<Ctrl-l> redraws the screen and removes any search highlight
nnoremap <silent> <leader>l :nohl<CR><C-l>
" Split window and split navigation
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w" Move window
map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l
"Tab Navigation
nnoremap th :tabprev<Return>
nnoremap tl :tabnext<Return>
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
"For copying between files
vmap <leader>y "*y
nmap <leader>p "*p
"So removing text doesn't kill my clipboard
nnoremap c "_c
nnoremap C "_C
"Vim Fugitive
nnoremap <leader>ga :Git add .<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gc :Gcommit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Gllog<CR>
nnoremap <leader>gm :Gmerge
nnoremap <leader>gps :Gpush
nnoremap <leader>gpl :Gpull
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gcb :Merginal<CR>
nnoremap <leader>gr :G<CR>
" Split resizing
nnoremap <silent> <Up>    :call animate#window_delta_height(5)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-5)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(5)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-5)<CR>
let g:animate#easing_func = 'animate#ease_out_quad'
"Dictionaries
map <F6> :set spell spelllang=en_us
map <F7> :set spell spelllang=pt
map <F8> :set spell spelllang=de
nnoremap <Leader>gy :Goyo<CR>
" Display tagbar with CTAGS
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" Signify for moving through hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
" NeoTerminal Navigation
nnoremap <silent> <leader>th :Tclose<cr>
nnoremap <silent> <leader>tl :Tclear<cr>
nnoremap <silent> <leader>tc :Tkill<cr>
nnoremap <leader>t :vsplit<CR> :term<CR>
nnoremap <leader>T :split<CR> :term<CR>
" exit terminal mode
tmap <leader>o <C-\><C-n>
" vim-tests commands
nmap <silent> <leader>rs :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>ra :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>
" Eunuch
nnoremap <leader>mv :Move
" Substitute word under cursor
nnoremap <leader>c :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
" FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
" Ctrl-P uses fzf
nnoremap <C-p> :Files<Cr>
" Crtl-S greps all files in root
nnoremap <C-s> :Rg<Cr>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

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
