return require('packer').startup(function(use)
    use 'nvim-lua/plenary.nvim'

    use 'wbthomason/packer.nvim'

    use 'dracula/vim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }

    use 'windwp/nvim-ts-autotag'

    use 'p00f/nvim-ts-rainbow'

    --use 'windwp/nvim-autopairs'

    --use 'folke/which-key.nvim'

    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    use 'williamboman/nvim-lsp-installer'

    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'onsails/lspkind-nvim'

    --use 'lukas-reineke/lsp-format.nvim'

    use 'vim-test/vim-test'

    use 'edgedb/edgedb-vim'

    use '/home/davidfactorial/plugins/testplugin.nvim'

    --use 'hynek/vim-python-pep8-indent'

    --use 'jose-elias-alvarez/null-ls.nvim'

    --use 'yuezk/vim-js'
    --use 'pangloss/vim-javascript'
    --use 'maxmellon/vim-jsx-pretty'

    --use 'sheerun/vim-polyglot'
    --[[

    use 'glepnir/lspsaga.nvim'

    use 'folke/lsp-colors.nvim'

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup()
        end
    }

    use 'posva/vim-vue'

    -- Coffeescript
    use 'kchmck/vim-coffee-script'
    use 'hilarryxu/vim-coffeescript'

    -- EdgeDB
    use 'edgedb/edgedb-vim'


    -- Dev icons
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {

                default = true
            }
        end
    }
    ]]
end)
