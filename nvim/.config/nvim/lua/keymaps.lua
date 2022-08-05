local map = vim.api.nvim_set_keymap

vim.cmd[[let mapleader=" "]]

-- Better horizontal movement
map('', 'H', '^', {})
map('', 'L', '$', {})

-- Move by line (wrapped text)
map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})

-- More intuitive Enter behavior
map('n', '<CR>', 'o<Esc>', {noremap = true})

-- Window mappings
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- Visual mode tab indent
map('v', '<Tab>', '>', {noremap = true})
map('v', '<S-Tab>', '<', {noremap = true})

-- "System" clipboard quickies
map('', '<Leader>y', '"+y', {})
map('', '<Leader>d', '"+d', {})
map('', '<Leader>p', '"+p', {})
map('', '<Leader>P', '"+P', {})
map('v', '<Leader>gy', 'my"+y`y', {})
map('v', 'gy', 'myy`y', {})

-- Toggle between buffers
map('n', '<Leader>a', '<C-^>', {})
-- Mappings

vim.cmd[[let mapleader=" "]]

-- Better horizontal movement
map('', 'H', '^', {})
map('', 'L', '$', {})

-- Move by line (wrapped text)
map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})

-- More intuitive Enter behavior
map('n', '<CR>', 'o<Esc>', {noremap = true})

-- Window mappings
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- Visual mode tab indent
map('v', '<Tab>', '>', {noremap = true})
map('v', '<S-Tab>', '<', {noremap = true})

-- "System" clipboard quickies
map('', '<Leader>y', '"+y', {})
map('', '<Leader>d', '"+d', {})
map('', '<Leader>p', '"+p', {})
map('', '<Leader>P', '"+P', {})
map('v', '<Leader>gy', 'my"+y`y', {})
map('v', 'gy', 'myy`y', {})

-- Toggle between buffers
map('n', '<Leader>a', '<C-^>', {})
