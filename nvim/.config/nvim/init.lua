require('options') -- Setters
require('keymaps') -- Keymaps
require('autocmds') -- Autcommands
require('functions')
require('scripts')
require('custom_commands')

-- Plugins
require('plugins.lazy_bootstrap') -- load lazy into vim runtime path
local plugins = require('plugins.lazy_plugins')
require("lazy").setup({
  plugins,
})
