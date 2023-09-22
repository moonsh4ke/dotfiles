return {
  "folke/neodev.nvim",

  -- Colorscheme
  -- {
  --  'morhetz/gruvbox', -- Colortheme
  --  config = function () require('plugins.config.colorscheme') end,
  -- },

  -- 'https://github.com/Shatur/neovim-ayu'
  -- 'https://github.com/Mofiqul/vscode.nvim'
  {
    'https://github.com/rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function() require('plugins.config.colorscheme') end,
  },
  --  config = function () require('plugins.config.colorscheme') end,
  -- 'https://github.com/EdenEast/nightfox.nvim'
  -- 'shaunsingh/nord.nvim'
  -- 'projekt0n/github-nvim-theme'
  -- habamax
  --

  -- Git signs in the side panel
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end
  },

  {
    'tpope/vim-fugitive',
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    config = function() require('plugins.config.lualine') end
  },

  -- Buffer bar like modern editors display files being edited
  {
    'akinsho/bufferline.nvim',
    config = function() require("bufferline").setup{} end
  },

  -- Start screen (recent files, bookmarks, etc)
  {
    'mhinz/vim-startify',
    config = function() require('plugins.config.startify') end
  },

  -- Pretty icons
  'kyazdani42/nvim-web-devicons',

  -- Display identation levels like modern editor
  -- 'lukas-reineke/indent-blankline.nvim'

  -- Visual help for colors, for example: #558867
  {
    'norcalli/nvim-colorizer.lua',
    config = function() require 'colorizer'.setup() end
  },
  -- Indentation & syntax hl for react files

  'MaxMEllon/vim-jsx-pretty',

  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = { null_ls.builtins.formatting.prettier }
      })
    end
    -- config = function() require('plugins.config.null-ls') end
  },

  -- Tmux integration in vim (syntax hl, comments, documentation with 'K', etc)
  'tmux-plugins/vim-tmux',

  -- vim's window navigation keys to apply to tmux panes
  'christoomey/vim-tmux-navigator',

  -- Dont highlight search pattern after search has ended
  'romainl/vim-cool',

  -- Add surrounds [] () {}, delete them, change them
  'tpope/vim-surround',

  -- Comment string integration
  'tpope/vim-commentary',

  -- Awesome undo history
  {
    'simnalamburt/vim-mundo',
    config = function() vim.api.nvim_set_keymap('n', '<leader>u', ':MundoToggle<CR>', { noremap = true }) end
  },

  -- Auto close ( { [
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  },
  -- Auto close html tags
  {
    'windwp/nvim-ts-autotag',
  },

  -- gpg files
  {
    'https://github.com/jamessan/vim-gnupg',
    config = function() vim.cmd "let g:GPGPreferSymmetric=1" end
  },

  -- f with steroids
  'ggandor/lightspeed.nvim',

  -- Browser + markdown file integration
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- Treesitter to put comment strings in embedded languages
  -- 'JoosepAlviste/nvim-ts-context-commentstring'

  -- lsp functionality without lsp
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function() require('plugins.config.treesitter') end,
    -- config = function() vim.cmd[[echo "jello"]] end
  },

  -- Debug treesitter
  'nvim-treesitter/playground',

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function() require('plugins.config.telescope') end
  },

  -- Lsp integration in nvim
  {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.config.lspconfig') end
  },

  -- Installer for lsp servers and daps (debugger adapter protocol)
  {
    'williamboman/mason.nvim',
    config = function() require("mason").setup() end
  },

  -- "Bride between lspconfig and mason"
  {
    'williamboman/mason-lspconfig.nvim',
    config = function() require("mason-lspconfig").setup() end
  },

  -- Completion
  'hrsh7th/cmp-nvim-lsp', -- lsp provided completion
  'hrsh7th/cmp-buffer', -- buffer completion
  'hrsh7th/cmp-path', -- paths completion
  'hrsh7th/cmp-cmdline', -- Completions for / search based on current buffer
  'hrsh7th/nvim-cmp', -- THE completion engine
  -- 'hrsh7th/cmp-vsnip',
  -- 'hrsh7th/vim-vsnip',
  'L3MON4D3/LuaSnip', -- Snippets
  'saadparwaiz1/cmp_luasnip', -- Completion for snippets

  -- Modern editor file tree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function() require('plugins.config.nvim-tree') end
  },

  -- Debugger Adapter Protocol integration in vim
  {
    "mfussenegger/nvim-dap",
    config = function() require('plugins.config.dap') end
  },

  -- UI for debugging
  {
    "rcarriga/nvim-dap-ui",
    config = function() require('plugins.config.dapui') end
  },

  -- Extension for nvim-dap with python integration
  {
    'mfussenegger/nvim-dap-python',
    config = function() require('dap-python').setup('~/.virtualenvs/debugpy/bin/python') end
  },

  -- Argument suggestions in functions based in lsp
  -- {
  --   'ray-x/lsp_signature.nvim',
  --   config = function() require "plugins.config.lsp_signature" end
  -- }
}
