-- Non-plugin mappings

local map = vim.api.nvim_set_keymap

vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

vim.cmd[[let mapleader=" "]]

-- Quick date (NOW!)
map('n', '<Leader>N', 'a=strftime("%a %d %b %Y %H:%M")<CR>', {})

-- Better horizontal movement
map('', 'H', '^', {})
map('', 'L', '$', {})

-- Move by line (wrapped text)
map('n', 'j', 'gj', {noremap = true})
map('n', 'k', 'gk', {noremap = true})

-- -- More intuitive Enter behavior
-- map('n', '<CR>', 'o<Esc>', {noremap = true})

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

-- Window mappings
map('n', '<C-j>', '<C-w>j', {noremap = true})
map('n', '<C-h>', '<C-w>h', {noremap = true})
map('n', '<C-k>', '<C-w>k', {noremap = true})
map('n', '<C-l>', '<C-w>l', {noremap = true})

-- Improves for tab indent in normal and visual mode

-- Visual mode tab indent
-- map('v', '<Tab>', '>', {noremap = true})
-- map('v', '<S-Tab>', '<', {noremap = true})
-- map('v', '<Tab>', '>gv4l', {noremap = true})
-- map('v', '<S-Tab>', '<gv4h', {noremap = true})
-- map('n', '<Tab>', 'V>4l', {noremap = true})
-- map('n', '<S-Tab>', 'V<4h', {noremap = true})
map('i', '<S-Tab>', '<C-d>', {noremap = true})

-- Center screen after jumps
map('n', 'n', 'nzz', {noremap = true})
map('n', 'N', 'Nzz', {noremap = true})
map('n', '{', '{zz', {noremap = true})
map('n', '}', '}zz', {noremap = true})
map('n', '*', '*zz', {noremap = true})
map('n', '#', '#zz', {noremap = true})
map('n', '<C-o>', '<C-o>zz', {noremap = true})
map('n', '<C-i>', '<C-i>zz', {noremap = true})

-- "System" clipboard quickies
map('', '<Leader>y', '"+y', {})
map('', '<Leader>d', '"+d', {})
map('', '<Leader>p', '"+p', {})
map('', '<Leader>P', '"+P', {})
map('v', '<Leader>gy', 'my"+y`y', {})
map('v', 'gy', 'myy`y', {})

-- Toggle between buffers
map('n', '<Leader>a', '<C-^>', {})
