-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- vim.cmd "![ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ] && git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim"
-- vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
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
        config=vim.api.nvim_set_keymap('n', '<space>cc', ':ConvertColorTo ', {noremap = true})
    }
    use 'hrsh7th/vim-vsnip'
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require'autopairs'
            vim.cmd[[
            function AuPair()
            lua reqire 'nvim-autopairs'.autopairs_cr()
            endfunction
            ]]
        end
    }
    use {
        'AckslD/nvim-revJ.lua',
        requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
        config = require("revj").setup{
            keymaps = {
                operator = '<Leader>J', -- for operator (+motion)
                line = '<Leader>j', -- for formatting current line
                visual = '<Leader>j', -- for formatting visual selection
            },
        }
    }

-- laf
    use {
        'gruvbox-community/gruvbox',
        config=vim.cmd "colorscheme gruvbox"
    }

    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        -- your statusline
        config = require'my_statusline',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'glepnir/dashboard-nvim',
        config = function ()
            vim.cmd[[au filetype dashboard nnoremap <buffer>q ZZ]]
            vim.cmd[[au filetype dashboard nnoremap <buffer><leader>q ZZ]]
            vim.cmd[[ autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2 ]]
        end
    }

    use { 'alvarosevilla95/luatab.nvim',
        requires='kyazdani42/nvim-web-devicons',
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
        config=require'telescopeConf',
    }

    use { 'glepnir/lspsaga.nvim',
        config = require'lspsaga'.init_lsp_saga()
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
        config = require'lsp'
    }
    use {
        "hrsh7th/nvim-compe",
        opt = false,
        config = require'compeConf'
    }
    use 'tamago324/compe-zsh'
    use {
        'mfussenegger/nvim-dap',
        config = require'dapConf'
    }
    use 'aymericbeaumet/vim-symlink'
    use {
        'RishabhRD/nvim-lsputils',
        config = require'lsputil_conf',
    }
    use 'RishabhRD/popfix'
    use 'tjdevries/nlua.nvim'

-- info
    use {
        'haringsrob/nvim_context_vt',
        config = require('nvim_context_vt').setup()
    }
    use 'kyazdani42/nvim-tree.lua'
    use 'norcalli/nvim-colorizer.lua'
    use { 'szw/vim-dict',
        config =
        vim.api.nvim_set_keymap(
            'n',
            '<space>dic',
            ':Dict <c-r>=expand("<cword>")<Return><Return>',
            {noremap=true}
        )
    }
    use { 'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = require('gitsigns').setup()
    }
    use { 'nvim-treesitter/nvim-treesitter',
        config = require'treesitter'
    }
    use { 'glepnir/indent-guides.nvim',
        config = require'indent_guides_conf'
    }
    use 'vim-scripts/mom.vim'
    use 'tversteeg/registers.nvim'
    use { 'ray-x/lsp_signature.nvim',
        config = require'signature_conf',
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
        config = require'toggleterm_conf',
    }


end)
