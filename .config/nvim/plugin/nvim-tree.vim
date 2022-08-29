" directory navigation
lua << EOF
  require'nvim-tree'.setup {}
EOF
nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_auto_open = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
