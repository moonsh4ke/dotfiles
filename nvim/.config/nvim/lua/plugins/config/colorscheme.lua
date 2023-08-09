-- Gruvbox
vim.cmd([[
    if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    endif
		colorscheme kanagawa
]])

-- vim.cmd[[
-- let ayucolor="light"  " for light version of theme
-- let ayucolor="mirage" " for mirage version of theme
-- let ayucolor="dark"   " for dark version of theme
-- colorscheme ayu
-- ]]

-- vim.cmd[[
-- 	" let g:gruvbox_sign_column='bg0'
-- 	" let g:gruvbox_contrast_dark = 'hard'
-- 	" let g:gruvbox_invert_selection='0'
-- 	" let g:gruvbox_italic=1
-- 	" set background=dark
-- 	" colorscheme gruvbox
-- ]]

-- Tokyonight
-- vim.cmd[[colorscheme tokyonight]]
