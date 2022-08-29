lua << EOF
  require'lspconfig'.gopls.setup{}
EOF

nnoremap <leader>gs :GoTestFunc<CR>
nnoremap <leader>ga :GoTest<CR>
nnoremap <leader>gr :GoRun<CR>

