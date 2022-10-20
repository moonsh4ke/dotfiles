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
  use {
          'morhetz/gruvbox', -- Colortheme
          config = function () require('config.colorscheme') end,
  }
  use {
          'lewis6991/gitsigns.nvim',
          config = function() require('gitsigns').setup() end
  }
  use 'tpope/vim-fugitive'
  use {
          'nvim-lualine/lualine.nvim',
          config = function() require('lualine').setup({ options = { theme = 'gruvbox-material' } }) end

  }
  use {
          'akinsho/bufferline.nvim',
          config = function() require("bufferline").setup{} end
  }
  use {
          'mhinz/vim-startify',
          config = function() require('config.startify') end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
      'norcalli/nvim-colorizer.lua',
      config = function() require'colorizer'.setup() end
  }
  use 'MaxMEllon/vim-jsx-pretty'
  use {
          'mattn/emmet-vim',
          config = function() vim.cmd[[let g:user_emmet_expandabbr_key = '<M-e>']] end
      }

  use 'tmux-plugins/vim-tmux'
  use 'christoomey/vim-tmux-navigator'
  use 'romainl/vim-cool'
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use {
          'simnalamburt/vim-mundo',
          config = function() vim.api.nvim_set_keymap('n', '<leader>u', ':MundoToggle<CR>', {noremap = true}) end
  }

  -- use {
  --         'windwp/nvim-autopairs',
  --         config = function() require("nvim-autopairs").setup{} end
  -- }

  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'windwp/nvim-ts-autotag',
  }

  use 'ggandor/lightspeed.nvim'
  use 'machakann/vim-highlightedyank'
  use{
          "iamcco/markdown-preview.nvim",
          run = function() vim.fn["mkdp#util#install"]() end,
  }
  -- use 'JoosepAlviste/nvim-ts-context-commentstring'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
      config = function() require('config.treesitter') end,
      -- config = function() vim.cmd[[echo "jello"]] end
  }
  use 'nvim-treesitter/playground'
  use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function() require('config.telescope') end
  }
  use {
      'neovim/nvim-lspconfig',
      config = function() require('config.lspconfig') end
  }

  use {
      'williamboman/mason.nvim',
      config = function() require("mason").setup() end
  }
  use {
      'williamboman/mason-lspconfig.nvim',
      config = function() require("mason-lspconfig").setup() end
  }

  -- Completion
  use {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'hrsh7th/nvim-cmp',
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
          'L3MON4D3/LuaSnip',
          'saadparwaiz1/cmp_luasnip', 
  }

  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly', -- optional, updated every week. (see issue #1193)
      config = function() require('config.nvim-tree') end
  }

  -- Debugging
  use {
          "mfussenegger/nvim-dap",
          config = function() require('config.dap') end
      }

  use { 
          "rcarriga/nvim-dap-ui",
          config = function() require('config.dapui') end
      }

  use {
      'mfussenegger/nvim-dap-python',
      config = function() require('dap-python').setup('~/.virtualenvs/debugpy/bin/python') end
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
}})
