lua << EOF
  require'lspconfig'.gopls.setup{}
EOF

nnoremap <leader>gt :GoTestFunc<CR>
nnoremap <leader>ga :GoTest<CR>
nnoremap <leader>gr :GoRun<CR>

