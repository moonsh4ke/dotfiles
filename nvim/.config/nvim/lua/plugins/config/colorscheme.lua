-- local theme_name = "kanagawa"
--

local theme_name = "kanagawa"

local bg = "light"
local current_hour = os.date("*t").hour
if current_hour >= 16 or current_hour <= 8 then
	bg = "dark"
end

vim.cmd("set bg=" .. bg)

vim.cmd("colorscheme  " .. theme_name)

-- vim.cmd("colorscheme kanagawa")

local lualine = require("lualine")

lualine.setup({
	sections = {
		lualine_c = {
			function()
				return vim.fn.pathshorten(vim.fn.fnamemodify(vim.fn.getcwd(), ":~"), 4)
			end,
			"filename",
		},
	},
})

-- vim.cmd[[
-- let ayucolor="light"  " for light version of theme
-- let ayucolor="mirage" " for mirage version of theme
-- let ayucolor="dark"   " for dark version of theme
-- colorscheme ayu
-- ]]

-- vim.cmd[[
--  " let g:gruvbox_sign_column='bg0'
--  " let g:gruvbox_contrast_dark = 'hard'
--  " let g:gruvbox_invert_selection='0'
--  " let g:gruvbox_italic=1
--  " set background=dark
--  " colorscheme gruvbox
-- ]]

-- Tokyonight
-- vim.cmd[[colorscheme tokyonight]]
