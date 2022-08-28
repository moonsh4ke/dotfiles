require("nvim-tree").setup()
local map = vim.api.nvim_set_keymap
map('n', '<leader>t', '<cmd>NvimTreeToggle<CR>', {})
