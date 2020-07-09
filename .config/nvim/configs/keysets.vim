" This file contains remaps of keys I use

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
