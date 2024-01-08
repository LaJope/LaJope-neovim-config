-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use('nvim-lua/plenary.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'sainnhe/gruvbox-material' }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

    use { 'nvim-lua/plenary.nvim' }
    use { 'ThePrimeagen/harpoon' }

    use { 'mbbill/undotree' }
    use { 'tpope/vim-fugitive' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            -- Doesn't work
            --{'saadparwaiz1/cmp_lualsp'},
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }
    use('nvim-tree/nvim-web-devicons')
    use('nvim-tree/nvim-tree.lua')
    use('lukas-reineke/indent-blankline.nvim')
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- use('mfussenegger/nvim-dap')
    use('jay-babu/mason-nvim-dap.nvim')
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

    use('lewis6991/gitsigns.nvim')
    -- MIGRATE TO akinsho/bufferline.nvim       URL: https://github.com/akinsho/bufferline.nvim
    use('romgrk/barbar.nvim')

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use('tpope/vim-obsession')

    use {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
        },
    }

    use {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
        },
    }

    -- use('Civitasv/cmake-tools.nvim') !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1


    -- Breaks stuff. Displays keymaps
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup {}
    --     end
    -- }
end)
