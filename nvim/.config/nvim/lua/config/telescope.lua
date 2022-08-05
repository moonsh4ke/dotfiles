-- Telescope
map = vim.api.nvim_set_keymap
map('n', '<leader>.', '<cmd>Telescope find_files theme=dropdown<cr>', {})
map('n', '<leader>,', '<cmd>Telescope buffers theme=dropdown<cr>', {})
map('n', '<leader>:', '<cmd>Telescope builtin theme=dropdown<cr>', {})
