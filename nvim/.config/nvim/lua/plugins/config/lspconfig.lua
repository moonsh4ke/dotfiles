-- Disable diagnostid virtual text
vim.diagnostic.config(
  {
    virtual_text = false,
  }
)
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = require("plugins.config.lspconfig_on_attach")
local capabilities = require("plugins.config.completion")

-- require'lspconfig'.jedi_language_server.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags
-- }

-- require('lspconfig')['tsserver'].setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   flags = lsp_flags
-- }

require'lspconfig'.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

require'lspconfig'.bashls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

require'lspconfig'.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require'lspconfig'.jdtls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags
}

require'lspconfig'.emmet_ls.setup{
  -- on_attach = on_attach,
  capabilities = capabilities,
  cmd  = { "emmet-ls", "--stdio" },
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue" },
}

require'lspconfig'.clangd.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

require'lspconfig'.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}


require'lspconfig'.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

require'lspconfig'.marksman.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}

require'lspconfig'.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = lsp_flags
}
