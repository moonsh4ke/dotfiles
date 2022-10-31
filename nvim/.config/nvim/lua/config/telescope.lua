-- Telescope
builtin = require("telescope.builtin")
themes = require("telescope.themes")

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    }
	}
}

-- map = vim.api.nvim_set_keymap
map = vim.keymap.set
map('n', '<leader>.', '<cmd>Telescope find_files theme=dropdown<cr>', {})
map('n', '<leader>,', '<cmd>Telescope buffers theme=dropdown<cr>', {})
map('n', '<leader>:', '<cmd>Telescope builtin theme=dropdown<cr>', {})
map('n', '<leader>n', function() builtin.find_files({cwd = "~/.config/nvim/lua"}) end, {})
