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
    use {
        'amadeus/vim-convert-color-to',
        config=function()
            vim.api.nvim_set_keymap('n', '<space>cc', ':ConvertColorTo ', {noremap = true})
        end
    }
    use 'hrsh7th/vim-vsnip'
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require'autopairs'
            vim.cmd[[
            function! AuPair()
            lua reqire 'nvim-autopairs'.autopairs_cr()
            endfunction
            ]]
        end
    }
    use {
        'AckslD/nvim-revJ.lua',
        requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
        config = function ()
            require("revj").setup{
                keymaps = {
                    operator = '<Leader>J', -- for operator (+motion)
                    line = '<Leader>j', -- for formatting current line
                    visual = '<Leader>j', -- for formatting visual selection
                }
            }
        end
    }

-- laf
    use { "rktjmp/lush.nvim" }

        -- "npxbr/gruvbox.nvim",
    use {
        '~/dev/gruv',
         config = function ()
            vim.cmd[[colorscheme gruv]]
         end
  }

  use {
    'tjdevries/express_line.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require'el_conf'
    end
  }

  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function ()
            vim.api.nvim_set_keymap('n', '<space>l', ':BufferNext<cr>', { noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<space>h', ':BufferPrevious<cr>', { noremap = true, silent = true})
        end
    }

-- Navigation
    use {
        'unblevable/quick-scope',
        config = function ()
            vim.api.nvim_exec([[
            highlight QuickScopePrimary guifg='#d3869b' gui=underline ctermfg=34 cterm=underline
            highlight QuickScopeSecondary guifg='#fabd2f' gui=underline ctermfg=81 cterm=underline

            let g:qs_max_chars=255

            augroup qs_colors
            autocmd!
            autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
            autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
            augroup END
            ]], true)
        end
    }

    use { 'nvim-telescope/telescope-fzy-native.nvim',
        config = function()
        require"telescope".load_extension("fzy_native")
        end
    }

    use { 'nvim-telescope/telescope.nvim',
        config=function ()
        require'telescopeConf'
        end
    }

    use { 'glepnir/lspsaga.nvim',
        config =function()
            require'lspsaga'.init_lsp_saga()
        end
    }

-- backend
    use 'kabouzeid/nvim-lspinstall'
    use 'tpope/vim-repeat'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'airblade/vim-rooter'
    use 'tpope/vim-sleuth'
    use {
        'neovim/nvim-lspconfig',
        opt = false,
        config =function ()
            require'lsp'
        end
    }
    use {
        "hrsh7th/nvim-compe",
        opt = false,
        config =function ()
            require'compeConf'
        end
    }
    use 'tamago324/compe-zsh'
    use {
        'mfussenegger/nvim-dap',
        config =function ()
            require'dapConf'
        end
    }
    use 'aymericbeaumet/vim-symlink'
    use {
        'RishabhRD/nvim-lsputils',
        config =function ()
            require'lsputil_conf'
        end
    }
    use 'RishabhRD/popfix'
    use 'tjdevries/nlua.nvim'

  -- info
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  use 'kyazdani42/nvim-tree.lua'
  use 'norcalli/nvim-colorizer.lua'
  use { 'szw/vim-dict',
    config = function ()
      vim.api.nvim_set_keymap(
        'n',
        '<space>dic',
        ':Dict <c-r>=expand("<cword>")<Return><Return>',
        {noremap=true}
      )
    end
  }
  use { 'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config =function ()
      require'gitsigns_conf'
    end
  }

    use { 'nvim-treesitter/nvim-treesitter',
        config =function ()
            require'nvim-treesitter.configs'.setup(require'treesitter')
        end
    }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use 'vim-scripts/mom.vim'
    use 'tversteeg/registers.nvim'
    use { 'ray-x/lsp_signature.nvim',
        config =function ()
            require'signature_conf'
        end
    }
    use { 'sudormrfbin/cheatsheet.nvim',
      requires = {
        {'nvim-telescope/telescope.nvim'},
        {'nvim-lua/popup.nvim'},
        {'nvim-lua/plenary.nvim'},
      }
    }

-- other
  use 'ThePrimeagen/vim-be-good'
  use { 'akinsho/nvim-toggleterm.lua',
    config =function ()
      require'toggleterm_conf'
    end
  }
  use {
    'TimUntersberger/neogit',
    requires = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim'
    },
    config = function ()
      require'neogit_conf'
    end
  }
  use 'sindrets/diffview.nvim'
  use 'nvim-treesitter/playground'

end)

