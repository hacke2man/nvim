-- auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- auto update
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua call system('[ -f ~/.cache/nvim/update_plugins ] || touch ~/.cache/nvim/update_plugins')"
vim.cmd "autocmd VimEnter * call Sync()"


return require('packer').startup({
  {  -- PLUGIN MANAGER
     --================--
    {
      'wbthomason/packer.nvim',
    },
    -- TEXT EDITING
    --==============--
    {
      'blackCauldron7/surround.nvim',
      config = function()
	vim.g.surround_mappings_style = "surround"
	require "surround".setup {}
      end
    },
    {
      'b3nj5m1n/kommentary',
    },
    {
      'amadeus/vim-convert-color-to',
      config=function()
	vim.api.nvim_set_keymap('n', '<space>cc', ':ConvertColorTo ', {noremap = true})
      end
    },
    {
      'hrsh7th/vim-vsnip',
    },
    {
      'windwp/nvim-autopairs',
      config = function ()
	require'autopairs'
	vim.cmd[[
	function! AuPair()
	lua reqire 'nvim-autopairs'.autopairs_cr()
	endfunction
	]]
      end
    },
    {
      'AckslD/nvim-revJ.lua',
      requires = {'kana/vim-textobj-user', 'sgur/vim-textobj-parameter'},
      config = function ()
	require("revj").setup {
	  keymaps = {
	    operator = '<Leader>J', -- for operator (+motion)
	    line = '<Leader>j', -- for formatting current line
	    visual = '<Leader>j', -- for formatting visual selection
	  }
	}
      end
    },
    {
      'nvim-lua/completion-nvim',
    },

    -- LAF
    --=====--
    {
      "rktjmp/lush.nvim",
    },
    {
      "npxbr/gruvbox.nvim",
    },
    {
      '~/dev/gruv.nvim',
      config = function ()
	vim.cmd[[colorscheme gruv]]
      end
    },
    {
      'tjdevries/express_line.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function ()
	require'el_conf'
      end
    },
    {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons', opt = true},
      config = function ()
	vim.api.nvim_set_keymap('n', '<space>l', ':BufferNext<cr>', { noremap = true, silent = true})
	vim.api.nvim_set_keymap('n', '<space>h', ':BufferPrevious<cr>', { noremap = true, silent = true})
      end
    },

    -- NAVIGATION
    --============--
    {
      'unblevable/quick-scope',
    },
    {
      'nvim-telescope/telescope-fzy-native.nvim',
      requires = 'romgrk/fzy-lua-native'
    },
    {
      'nvim-telescope/telescope.nvim',
      config=function ()
	require'telescopeConf'
      end,

    },

    -- BACKEND
    --=========--
    {
      'kabouzeid/nvim-lspinstall',
    },
    {
      'tpope/vim-repeat',
    },
    {
      'nvim-lua/plenary.nvim',
    },
    {
      'nvim-lua/popup.nvim',
    },
    {
      'airblade/vim-rooter',
    },
    {
      'tpope/vim-sleuth',
    },
    {
      'neovim/nvim-lspconfig',
      opt = false,
      config =function ()
	require'lsp'
      end
    },
    {
      'mfussenegger/nvim-dap',
      config =function ()
	require'dapConf'
      end
    },
    {
      'aymericbeaumet/vim-symlink',
    },
    {
      'RishabhRD/nvim-lsputils',
      config =function ()
	require'lsputil_conf'
      end
    },
    {
      'RishabhRD/popfix',
    },

    -- INFO
    --======--
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    {
      'p00f/nvim-ts-rainbow',
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
	require("trouble").setup {
	  --your configuration comes here
	  --or leave it empty to  the default settings
	  --refer to the configuration section below
	}
      end
    },
    {
      'kyazdani42/nvim-tree.lua',
    },
    {
      'norcalli/nvim-colorizer.lua',
    },
    {
      'szw/vim-dict',
      config = function ()
	vim.api.nvim_set_keymap(
	  'n',
	  '<space>dic',
	  ':Dict <c-r>=expand("<cword>")<Return><Return>',
	  {noremap=true}
	)
      end,
    },
    {
      'lewis6991/gitsigns.nvim',
      requires = {
	'nvim-lua/plenary.nvim'
      },
      config =function ()
	require'gitsigns_conf'
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter',
      config =function ()
	require'nvim-treesitter.configs'.setup(require'treesitter')
      end,
    },
    {
      'haringsrob/nvim_context_vt',
    },
    {
      'lukas-reineke/indent-blankline.nvim',
    },
    {
      'vim-scripts/mom.vim',
    },
    {
      'tversteeg/registers.nvim',
    },
    { 'ray-x/lsp_signature.nvim',
      config =function ()
	require'signature_conf'
      end
    },
    { 'sudormrfbin/cheatsheet.nvim',
      requires = {
	{'nvim-telescope/telescope.nvim'},
	{'nvim-lua/popup.nvim'},
	{'nvim-lua/plenary.nvim'},
      }
    },

    -- OTHER
    --=======--
    {
      'ThePrimeagen/vim-be-good',
    },
    {
      'akinsho/nvim-toggleterm.lua',
      config =function ()
	require'toggleterm_conf'
      end,
    },
    {
      'TimUntersberger/neogit',
      requires = {
	'nvim-lua/plenary.nvim',
	'sindrets/diffview.nvim'
      },
      config = function ()
	require'neogit_conf'
      end
    },
    {
      'sindrets/diffview.nvim',
    },
    {
      'nvim-treesitter/playground',
    },
}, config = {} })
