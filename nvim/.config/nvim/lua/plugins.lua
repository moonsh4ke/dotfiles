local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Run PackerCompile whenever this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])


return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim' -- Package manager

	-- Colorscheme
	use {
		'morhetz/gruvbox', -- Colortheme
		config = function () require('config.colorscheme') end,
	}

	-- Git signs in the side panel
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require('gitsigns').setup() end
	}

	-- Git integration
  use 'tpope/vim-fugitive'

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		config = function() require('lualine').setup({ options = { theme = 'gruvbox-material' } }) end
	}


	-- Buffer bar like modern editors display files being edited
	use {
		'akinsho/bufferline.nvim',
		config = function() require("bufferline").setup{} end
	}

	-- Start screen (recent files, bookmarks, etc)
	use {
		'mhinz/vim-startify',
		config = function() require('config.startify') end
	}

	-- Pretty icons
  use 'kyazdani42/nvim-web-devicons'

	-- Display identation levels like modern editor
  use 'lukas-reineke/indent-blankline.nvim'

	-- Visual help for colors, for example: #558867
	use {
		'norcalli/nvim-colorizer.lua',
		config = function() require'colorizer'.setup() end
	}

	-- Indentation & syntax hl for react files
  use 'MaxMEllon/vim-jsx-pretty'
	use {
		'mattn/emmet-vim',
		config = function() vim.cmd[[let g:user_emmet_expandabbr_key = '<M-e>']] end
	}

	-- Tmux integration in vim (syntax hl, comments, documentation with 'K', etc)
  use 'tmux-plugins/vim-tmux'

	-- Use vim's window navigation keys to apply to tmux panes
  use 'christoomey/vim-tmux-navigator'

	-- Dont highlight search pattern after search has ended
  use 'romainl/vim-cool'

	-- Add surrounds [] () {}, delete them, change them
  use 'tpope/vim-surround'

	-- Comment string integration
  use 'tpope/vim-commentary'

	-- Awesome undo history
	use {
		'simnalamburt/vim-mundo',
		config = function() vim.api.nvim_set_keymap('n', '<leader>u', ':MundoToggle<CR>', {noremap = true}) end
	}

	-- Auto close ( { [
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
  }

	-- Auto close html tags
  use {
    'windwp/nvim-ts-autotag',
  }

	-- f with steroids
  use 'ggandor/lightspeed.nvim'

	-- Highlight copied text
  use 'machakann/vim-highlightedyank'

	-- Browser + markdown file integration
	use{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}

	-- Use Treesitter to put comment strings in embedded languages
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'

	-- lsp functionality without lsp
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		config = function() require('config.treesitter') end,
		-- config = function() vim.cmd[[echo "jello"]] end
	}

	-- Debug treesitter his parse tree
  use 'nvim-treesitter/playground'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function() require('config.telescope') end
	}

	-- Lsp integration in nvim
	use {
		'neovim/nvim-lspconfig',
		config = function() require('config.lspconfig') end
	}

	-- Installer for lsp servers and daps (debugger adapter protocol)
	use {
		'williamboman/mason.nvim',
		config = function() require("mason").setup() end
	}

	-- "Bride between lspconfig and mason"
	use {
		'williamboman/mason-lspconfig.nvim',
		config = function() require("mason-lspconfig").setup() end
	}

  -- Completion
  use {
		'hrsh7th/cmp-nvim-lsp', -- lsp provided completion
		'hrsh7th/cmp-buffer', -- buffer completion
		'hrsh7th/cmp-path', -- paths completion
		'hrsh7th/cmp-cmdline', -- Completions for / search based on current buffer
		'hrsh7th/nvim-cmp', -- THE completion engine
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'L3MON4D3/LuaSnip', -- Snippets
		'saadparwaiz1/cmp_luasnip', -- Completion for snippets
  }

	-- Modern editor file tree
  use {
		'kyazdani42/nvim-tree.lua',
		requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly', -- optional, updated every week. (see issue #1193)
		config = function() require('config.nvim-tree') end
  }

  -- Debugger Adapter Protocol integration in vim
  use {
		"mfussenegger/nvim-dap",
		config = function() require('config.dap') end
	}

	-- UI for debugging
  use {
		"rcarriga/nvim-dap-ui",
		config = function() require('config.dapui') end
	}

	-- Extension for nvim-dap with python integration
	use {
		'mfussenegger/nvim-dap-python',
		config = function() require('dap-python').setup('~/.virtualenvs/debugpy/bin/python') end
	}

	-- Argument suggestions in functions based in lsp
  use {
    'ray-x/lsp_signature.nvim',
    config = function() require "lsp_signature".setup() end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

end,

	config = {
		display = {
			open_fn = function()
				return require('packer.util').float({ border = 'single' })
			end
		}
	}

})
