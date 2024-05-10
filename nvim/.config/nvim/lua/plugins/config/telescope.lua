-- Telescope
builtin = require("telescope.builtin")
themes = require("telescope.themes")
local actions = require "telescope.actions"

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      mappings = {
        n = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  }
}

-- map = vim.api.nvim_set_keymap
map = vim.keymap.set
map('n', '<leader>.', '<cmd>Telescope find_files theme=dropdown previewer=false<cr>', {})
map('n', '<leader>,', '<cmd>Telescope buffers theme=dropdown<cr>', {})
map('n', '<leader>:', '<cmd>Telescope builtin<cr>', {})
map('n', '<leader>l', '<cmd>Telescope live_grep<cr>', {})
map('n', '<leader>-', function() builtin.find_files({hidden=true, no_ignore=true}) end, {})
map('n', '<leader>n', function() builtin.find_files({cwd = "~/.config/nvim/lua"}) end, {})
