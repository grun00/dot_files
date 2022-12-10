nnoremap <silent> g0    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> g4    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> g3    <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> g2    <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> g1    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g5    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
