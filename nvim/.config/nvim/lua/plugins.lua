vim.cmd[[packadd packer.nvim]]

-- Run PackerCompile whenever this file is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
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
    use 'tmux-plugins/vim-tmux'
    use 'christoomey/vim-tmux-navigator'
    use 'romainl/vim-cool'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
            'simnalamburt/vim-mundo',
            config = function() vim.api.nvim_set_keymap('n', '<leader>u', ':MundoToggle<CR>', {noremap = true}) end
    }
    use {
            'windwp/nvim-autopairs',
            config = function() require("nvim-autopairs").setup{} end
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
        run = function() require('config.treesitter') end,
    }
    use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} },
            config = function() require('config.telescope') end
    }
end)
