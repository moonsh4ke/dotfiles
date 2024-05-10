return {

	-- Plug neovim runtime into lua lsp
	"folke/neodev.nvim",

	-- Colorscheme
	{
		"https://github.com/rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("plugins.config.colorscheme")
		end,
		dependencies = {
			"nvim-lualine/lualine.nvim",
			{
				"ellisonleao/gruvbox.nvim",
				priority = 1000,
				config = true,
			},
		},
	},

	-- Git signs in the side panel
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Git integration
	{
		"tpope/vim-fugitive",
	},

	-- Buffer bar like modern editors display files being edited
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({})
		end,
	},

	-- Start screen (recent files, bookmarks, etc)
	{
		"mhinz/vim-startify",
		config = function()
			require("plugins.config.startify")
		end,
	},

	-- Pretty icons
	"kyazdani42/nvim-web-devicons",

	-- Display identation levels like modern editor
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("ibl").setup({
				exclude = {
					filetypes = { "startify" },
				},
				indent = {
					char = "▏",
				},
				scope = {
					enabled = false,
				},
			})
		end,
	},

	-- Visual help for colors, for example: #558867
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Comment functionality
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			config = function()
				require("ts_context_commentstring").setup({
					enable_autocmd = false,
				})
			end,
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		lazy = false,
	},

	-- Format management
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- lua = { "stylua" },
					-- -- Conform will run multiple formatters sequentially
					-- python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javascript = { { "prettier" } },
					typescript = { { "prettier" } },
					javascriptreact = { { "prettier" } },
					typescriptreact = { { "prettier" } },
					json = { { "prettier" } },
					python = { { "black" } },
					lua = { { "stylua" } },
				},
			})
			vim.keymap.set("n", "<space>ff", require("conform").format, bufopts)
			vim.keymap.set("v", "<space>ff", require("conform").format, bufopts)
		end,
	},

	-- LSP diagnostic handling (errors, warnings, etc)
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- vim's window navigation keys to apply to tmux panes
	"christoomey/vim-tmux-navigator",

	-- Dont highlight search pattern after search has ended
	"romainl/vim-cool",

	-- Add surrounds [] () {}, delete them, change them
	"tpope/vim-surround",

	-- Undo tree
	{
		"mbbill/undotree",
		config = function()
			vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true })
		end,
	},

	-- Auto close html tags
	{
		"windwp/nvim-ts-autotag",
	},

	-- gpg files
	{
		"https://github.com/jamessan/vim-gnupg",
		config = function()
			vim.cmd("let g:GPGPreferSymmetric=1")
		end,
	},

	-- f with steroids
	-- 'ggandor/lightspeed.nvim',

	-- Browser + markdown file integration
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Treesitter to put comment strings in embedded languages
	-- 'JoosepAlviste/nvim-ts-context-commentstring'

	-- lsp functionality without lsp
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.config.treesitter")
		end,
	},

	-- Debug treesitter
	"nvim-treesitter/playground",

	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			local on_attach = require("plugins.config.lspconfig_on_attach")
			local capabilities = require("plugins.config.completion")
			require("typescript-tools").setup({
				on_attach = on_attach,
				capabilities = capabilities,
				flags = lsp_flags,
			})
		end,
	},

	{
		"dmmulroy/tsc.nvim",
		dependencies = {
			"rcarriga/nvim-notify",
		},
		config = function()
			require("tsc").setup()
		end,
	},

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("plugins.config.telescope")
		end,
	},

	-- Lsp integration in nvim
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lspconfig")
		end,
	},

	-- Installer for lsp servers and daps (debugger adapter protocol)
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- "Bridge between lspconfig and mason"
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},

	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- dependencies = { "rafamadriz/friendly-snippets" },
	-- 	config = function()
	-- 		require("plugins.config.luasnip")
	-- 	end,
	-- }, -- Snippets

	-- Completion
	"hrsh7th/cmp-nvim-lsp", -- lsp provided completion
	"hrsh7th/cmp-buffer", -- buffer completion
	"hrsh7th/cmp-path", -- paths completion
	"hrsh7th/cmp-cmdline", -- Completions for / search based on current buffer
	"hrsh7th/nvim-cmp", -- THE completion engine
	-- 'hrsh7th/cmp-vsnip',
	-- 'hrsh7th/vim-vsnip',
	-- "saadparwaiz1/cmp_luasnip", -- Completion for snippets

	-- Auto close ( { [
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	-- Modern editor file tree
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			require("plugins.config.nvim-tree")
		end,
	},

	{
		"https://github.com/tpope/vim-eunuch",
	},

	-- Argument suggestions in functions based in lsp
	-- {
	--   'ray-x/lsp_signature.nvim',
	--   config = function() require "plugins.config.lsp_signature" end
	-- }
	"sindrets/diffview.nvim",
	{
		"voldikss/vim-floaterm",
		config = function()
			vim.g.floaterm_width = 0.9
			vim.g.floaterm_height = 0.9
			vim.keymap.set("n", "<space>fn", ":FloatermNew<CR>", {})
			vim.keymap.set("n", "", ":FloatermToggle<CR>", {})
			vim.keymap.set("t", "", ":FloatermToggle<CR>", {})
		end,
	},
}
