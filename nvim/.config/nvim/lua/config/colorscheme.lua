-- Gruvbox
vim.cmd([[
    if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    endif
]])

vim.cmd[[let g:gruvbox_sign_column='bg0']]
vim.cmd[[let g:gruvbox_contrast_dark = 'hard']]
vim.cmd[[let g:gruvbox_invert_selection='0']]
vim.cmd[[let g:gruvbox_italic=1]]
vim.cmd[[set background=dark]]
vim.cmd[[colorscheme gruvbox]]

-- Tokyonight
-- vim.cmd[[colorscheme tokyonight]]
