-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- vim.cmd "![ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ] && git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
-- vim.cmd "autocmd BufWritePost plugins.lua source $VIM:|PackerSync"
-- vim.cmd "autocmd BufWritePost plugins.lua call system('[ -f ~/.cache/nvim/update_plugins ] || touch ~/.cache/nvim/update_plugins')"
-- vim.cmd "autocmd VimEnter * call Sync()"

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

-- editing
    use 'tpope/vim-surround'
    use 'b3nj5m1n/kommentary'
    use 'amadeus/vim-convert-color-to'
    use 'hrsh7th/vim-vsnip'
    use {
        'windwp/nvim-autopairs',
        config = require'autopairs'
    }
    use {
        'AckslD/nvim-revJ.lua',
        requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
        config = function()
            require("revj").setup{
                keymaps = {
                    operator = '<Leader>J', -- for operator (+motion)
                    line = '<Leader>j', -- for formatting current line
                    visual = '<Leader>j', -- for formatting visual selection
                },
            }
        end
    }

-- laf
    use 'gruvbox-community/gruvbox'
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = require'my_statusline',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'glepnir/dashboard-nvim'
    use { 'alvarosevilla95/luatab.nvim', requires='kyazdani42/nvim-web-devicons' }

-- Navigation
    use 'unblevable/quick-scope'
    use 'nvim-telescope/telescope.nvim'
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = require"telescope".load_extension("frecency")
    }

-- backend
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'airblade/vim-rooter'
    use 'tpope/vim-sleuth'
    use {
        'neovim/nvim-lspconfig',
        opt = false,
        config = require'compeConf'
    }
    use {
        "hrsh7th/nvim-compe",
        opt = false,
        config = require'compeConf'
    }
    use 'tamago324/compe-zsh'
    use 'kabouzeid/nvim-lspinstall'
    use {
        'mfussenegger/nvim-dap',
        config = require'dapConf'
    }
    use 'moll/vim-bbye'
    use 'aymericbeaumet/vim-symlink'
    use 'tami5/sql.nvim'
    use {
        'RishabhRD/nvim-lsputils',
        config = require'lsputil_conf',
    }
    use 'RishabhRD/popfix'
    use 'tjdevries/nlua.nvim'

-- info
    -- use 'Xuyuanp/yanil'
    use 'kyazdani42/nvim-tree.lua'
    use 'norcalli/nvim-colorizer.lua'
    use 'szw/vim-dict'
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = require('gitsigns').setup()
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = require'treesitter'
    }
    use {
        'glepnir/indent-guides.nvim',
        config = require'indent_guides_conf'
    }
    use 'vim-scripts/mom.vim'
    use 'tversteeg/registers.nvim'
    use {
        'ray-x/lsp_signature.nvim',
        config = require'signature_conf',
    }
    use {
      'sudormrfbin/cheatsheet.nvim',

      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
    }

-- other
    use 'ThePrimeagen/vim-be-good'
    use { 'akinsho/nvim-toggleterm.lua',
        config = require'toggleterm_conf',
    }


end)
