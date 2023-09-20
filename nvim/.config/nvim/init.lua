require('options') -- Setters
require('keymaps') -- Keymaps
require('autocmds') -- Autcommands
-- require('plugins') -- Plugins
require('functions')
require('scripts')

-- Plugins
require('plugins.lazy_bootstrap') -- load lazy into runtime
local plugins = require('plugins.lazy_plugins')
require("lazy").setup({
	plugins,
})
