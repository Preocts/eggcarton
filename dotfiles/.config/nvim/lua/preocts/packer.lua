-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Linters for neovim
    use 'mfussenegger/nvim-lint'

    -- Format all the things
    use 'sbdchd/neoformat'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

--    use ({
--        "catppuccin/nvim",
--        as = "catppuccin",
--        config = function()
--            vim.cmd('colorscheme catppuccin-latte')
--        end
--    })

    use ({
        'macguirerintoul/night_owl_light.vim',
        as = 'night_owl_light',
        config = function()
            vim.cmd('colorscheme night_owl_light')
        end
    })

    use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

end)

