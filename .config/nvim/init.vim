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
Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'rainerborene/vim-reek'
Plug 'tpope/vim-rhubarb'
Plug 'AndrewRadev/switch.vim'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'yuezk/vim-js'
Plug 'elixir-editors/vim-elixir'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'idanarye/vim-merginal'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'pbrisbin/vim-mkdir'
" Plug 'preservim/nerdtree'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons' " lua
Plug 'dense-analysis/ale'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/tComment'
Plug 'yuttie/comfortable-motion.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'kien/rainbow_parentheses.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
let g:AutoPairsMapCR=0
let g:deoplete#enable_at_startup = 1
" <TAB>: completion with deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"Colors
"Not Programming
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vimwiki/vimwiki'
Plug 'ghifarit53/tokyonight-vim'
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
" set ignorecase
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
set timeout timeoutlen=1500
filetype plugin on
filetype indent on

" Leader key is <space>
let mapleader=" "

" For repeating macros
nnoremap , @@

"<leader-l> redraws the screen and removes any search highlight
nnoremap <silent> <leader>l :nohl<CR><C-l>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Always start in same position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

" change word under cursor
nnoremap <leader>c :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" git diff
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

" Display tagbar with CTAGS
nnoremap <silent> <c-t> :TagbarToggle<CR>

" HTML autocomplete
let g:closetag_filenames = '*.html,*.xhtml,*.html.erb,*.erb, *.js'

"So removing text doesn't kill my clipboard
nnoremap c "_c
nnoremap C "_C

" FZF
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
" Ctrl-P uses fzf
nnoremap <C-p> :Files<Cr>
" Crtl-S greps all files in root
nnoremap <C-s> :Rg<Cr>
" nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader><Enter> :call fzf#run({
\   'source':  reverse(<sid>buflist()),
\   'sink':    function('<sid>bufopen'),
\   'options': '+m',
\   'down':    len(<sid>buflist()) + 2
\ })<CR>
nnoremap <M-t> :Tags<CR>

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

" :call fzf#run({
" \   'source':  reverse(<sid>buflist()),
" \   'sink':    function('<sid>bufopen'),
" \   'options': '+m',
" \   'down':    len(<sid>buflist()) + 2
" \ })<CR>

" Signify
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1
" next/prev hunk
nmap <leader>j <plug>(signify-next-hunk)
nmap <leader>k <plug>(signify-prev-hunk)


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

"Ale configs
packloadall
silent! helptags ALL
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
"comfortable-motion adjustments
let g:comfortable_motion_friction = 200.0
let g:comfortable_motion_air_drag = 3.0

"Nerdtree
" map <C-n> :NERDTreeToggle<CR>
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
" endfunction
" call NERDTreeHighlightFile('ru', 'green', 'none', 'green', '#151515')
" call NERDTreeHighlightFile('lock', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
" call NERDTreeHighlightFile('rb', 'Red', 'none', '#ff00ff', '#151515')

"Vim fugitive
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gbl :Git blame<CR>
nnoremap <leader>gc :Git commit -v -q<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gps :Git push origin HEAD<CR>
nnoremap <leader>gpl :Git pull origin HEAD<CR>
nnoremap <leader>gbr :GBranch<CR>
nnoremap <leader>gn :Merginal<CR>

let $FZF_DEFAULT_OPTS='--reverse'

colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
set background=dark
set fillchars+=vert:│
set laststatus=2
set t_Co=256
set termguicolors
syntax on

if !has('gui_running')
  set t_Co=256
endif

" just as it sounds
augroup highlightYankedText
    autocmd!
    autocmd TextYankPost *  silent! lua require'vim.highlight'.on_yank()
augroup END

" ================== writing
"Dictionaries
map <F6> :set spell spelllang=en_us
map <F7> :set spell spelllang=pt
map <F8> :set spell spelllang=de

" Wiki
let g:vimwiki_filetypes = ['markdown']
let g:vimwiki_diary_months = {
      \ 1: 'January', 2: 'February', 3: 'March',
      \ 4: 'April', 5: 'May', 6: 'June',
      \ 7: 'July', 8: 'August', 9: 'September',
      \ 10: 'October', 11: 'November', 12: 'December'
      \ }
"
" Goyo for no distraction writing
nnoremap <Leader>gy :Goyo<CR>

" ====================== misc functions
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

" pretty XML
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

" ================= navigation
" Buffer navigation
nnoremap <leader><Tab> :bn<Return>
noremap <leader>d :Bclose<CR>
" Navigation of lines
nnoremap  j gj
nnoremap  k gk
vnoremap  j gj
vnoremap  k gk
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
" NeoTerminal Navigation
nnoremap <silent> <leader>th :Tclose<cr>
nnoremap <silent> <leader>tl :Tclear<cr>
nnoremap <silent> <leader>tc :Tkill<cr>
nnoremap <leader>t :vsplit<CR> :term<CR>
nnoremap <leader>T :split<CR> :term<CR>
" exit terminal mode
tmap <M-o> <C-\><C-n>
"  Copy Relative Path and Copy Full Path
nmap crp :let @+=expand("%")<CR>
nmap cap :let @+=expand("%:p")<CR>
map Q q:
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" Split resizing
nnoremap <silent> <Up>    :call animate#window_delta_height(5)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-5)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(5)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-5)<CR>

let g:vimwiki_list = [ { 'syntax': 'markdown', 'ext': '.md' }]

" when line is over 120 characters, highlight the character
highlight ColorColumn ctermbg=0 guibg=magenta
call matchadd('ColorColumn', '\%120v',120)

" Rubocop
let g:vimrubocop_config = '/home/grun/.config/rubocop.yml'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntasti_ruby_rubocop_exec = '/home/grun/.rbenv/shims/rubocop'
let g:reek_on_loading = 0
" lua <<EOF
" require'lspconfig'.solargraph.setup{}
" EOF
" Rust
let g:rustfmt_autosave = 1
nnoremap <M-r> :RustFmt<CR>
nnoremap <leader>sc :lclose<CR>
" autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
call deoplete#custom#source('_', 'max_menu_width', 80)
let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

highlight Cursor guifg=magenta guibg=white
highlight iCursor guifg=green guibg=white
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR>

nnoremap <M-n> :set rnu!<CR>
nnoremap <leader>t :terminal<CR>
nmap <Leader>n :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap <M-g> :GBrowse<CR>
nnoremap <silent> <M-k> :<C-u>exe 'm -' . (v:count1 + 1)<cr>
nnoremap <silent> <M-j> :<C-u>exe 'm +' . v:count1<cr>
" copen, lopen cnext lnext, cprev, lprev
nnoremap <leader>cl :cnext
nnoremap <leader>ch :cprev
nnoremap <leader>ll :cnext
nnoremap <leader>lh :cprev

" Other tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
" Lua Plugins
lua << EOF
  require("statusline")
EOF


