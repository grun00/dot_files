" Rubocop
let g:vimrubocop_config = '/home/grun/.config/rubocop.yml'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntasti_ruby_rubocop_exec = '/home/grun/.rbenv/shims/rubocop'
let g:reek_on_loading = 0

" solargraph
lua << EOF
require'lspconfig'.solargraph.setup{}
EOF

" formatter
lua << EOF
require('formatter').setup({
  logging = false,
  filetype = {
    ruby = {
      -- rubocop run on one file
      function()
        return {
          exe = "rubocop", -- might prepend `bundle exec `
          args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', 'sed "1,/^====================$/d"' },
          stdin = true,
        }
      end
    }
  }
})
EOF
