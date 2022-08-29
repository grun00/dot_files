lua << EOF
  local lspconfig = require('lspconfig')
  lspconfig.pylsp.setup {
    settings = {
      plugins = {
        pylsp_mypy = {
          live_mode = false
        }
      }
    },
    flags = {debounce_text_changes = 150}
  }
EOF
