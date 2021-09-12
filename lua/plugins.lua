-- auto install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- auto update
--[[ vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
vim.cmd "autocmd BufWritePost plugins.lua call system('[ -f ~/.cache/nvim/update_plugins ] || touch ~/.cache/nvim/update_plugins')"
vim.cmd "autocmd VimEnter * call Sync()" ]]

return require('packer').startup({
  {  -- PLUGIN MANAGER
     --================--
     --HINT: Plugin Manager
    {
      'wbthomason/packer.nvim',
    },
    {
      'famiu/nvim-reload'
    },
    -- TEXT EDITING
    --==============--
    {
      'windwp/nvim-ts-autotag',
    },
    {
      'tpope/vim-surround',
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
      'windwp/nvim-autopairs',
      config = function ()
	require('nvim-autopairs').setup{}
	-- vim.api.nvim_set_keymap('i' , '<CR>',[[luaeval("require'autopairs_conf'.completion_confirm()")]], {expr = true, noremap = true})
	local remap = vim.api.nvim_set_keymap
	local npairs = require('nvim-autopairs')

	-- skip it, if you use another global object
	_G.MUtils= {}

	vim.g.completion_confirm_key = ""

	MUtils.completion_confirm=function()
	  if vim.fn.pumvisible() ~= 0  then
	    if vim.fn.complete_info()["selected"] ~= -1 then
	      require'completion'.confirmCompletion()
	      return npairs.esc("<c-y>")
	    else
	      vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
	      require'completion'.confirmCompletion()
	      return npairs.esc("<c-n><c-y>")
	    end
	  else
	    return npairs.autopairs_cr()
	  end
	end

	remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
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
        'hrsh7th/vim-vsnip',
	config = function ()
	  vim.g.vsnip_snippet_dir = os.getenv("XDG_CONFIG_HOME") .. "/nvim/vsnip"
	  vim.api.nvim_set_keymap('i', '<c-j>', 'vsnip#jumpable(1)   ? \'<Plug>(vsnip-jump-next)\' : \'<c-j>\'', {expr = true})
	  vim.api.nvim_set_keymap('i', '<c-k>', 'vsnip#jumpable(-1)  ? \'<Plug>(vsnip-jump-prev)\' : \'<c-k>\'', {expr = true})
	end
    },
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-nvim-lsp',
	'f3fora/cmp-spell',
	'hrsh7th/cmp-path',
      },
      config = function()
	require'cmp_conf'
      end
    },
    {
      'mhartington/formatter.nvim',
      config = function()
	require('formatter').setup({
	  logging = false,
	  filetype = {
	    html = {
	      -- prettier
	      function()
		return {
		  exe = "prettier",
		  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
		  stdin = true
		}
	      end
	    },
	    javascript = {
	      -- prettier
	      function()
		return {
		  exe = "prettier",
		  args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
		  stdin = true
		}
	      end
	    },
	    rust = {
	      -- Rustfmt
	      function()
		return {
		  exe = "rustfmt",
		  args = {"--emit=stdout"},
		  stdin = true
		}
	      end
	    },
	    lua = {
	      -- luafmt
	      function()
		return {
		  exe = "luafmt",
		  args = {"--indent-count", 2, "--stdin"},
		  stdin = true
		}
	      end
	    },
	    cpp = {
	      -- clang-format
	      function()
		return {
		  exe = "clang-format",
		  args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
		  stdin = true,
		  cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
		}
	      end
	    }
	  }
	});
      end
    },
    {
      "Pocco81/HighStr.nvim",
      config = function ()
	local high_str = require("high-str")

	high_str.setup({
	  verbosity = 0,
	  saving_path = "/tmp/highstr/",
	  highlight_colors = {
	    -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
	    color_0 = {"#504945", "smart"},-- dark
	    color_1 = {"#d79921", "smart"},	-- Pastel yellow
	    color_2 = {"#83a598", "smart"},	-- Aqua menthe
	    color_3 = {"#b16286", "smart"},	-- Proton purple
	    color_4 = {"#cc241d", "smart"},	-- Orange red
	    color_5 = {"#98971a", "smart"},	-- Office green
	    color_6 = {"#458588", "smart"},	-- Just blue
	    color_7 = {"#d3869b", "smart"},	-- Blush pink
	    color_8 = {"#fbf1c7", "smart"},	-- Cosmic latte
	    color_9 = {"#fe8019", "smart"},	-- Fallow brown
	  }
	})
      end
    },

    -- LAF
    --=====--
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
	vim.api.nvim_set_keymap('n', '<space>ic', ':TodoTrouble<cr>', {silent=true})
	require("todo-comments").setup {
	  -- your configuration comes here
	  -- or leave it empty to use the default settings
	  -- refer to the configuration section below
	  {
	    signs = true, -- show icons in the signs column
	    sign_priority = 8, -- sign priority
	    -- keywords recognized as todo comments
	    keywords = {
	      FIX = {
		icon = " ", -- icon used for the sign, and in search results
		color = "error", -- can be a hex color, or a named color (see below)
		alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
		-- signs = false, -- configure signs for some keywords individually
	      },
	      TODO = { icon = " ", color = "info" },
	      HACK = { icon = " ", color = "warning" },
	      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
	      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
	      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
	    },
	    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
	    -- highlighting of the line containing the todo comment
	    -- * before: highlights before the keyword (typically comment characters)
	    -- * keyword: highlights of the keyword
	    -- * after: highlights after the keyword (todo text)
	    highlight = {
	      before = "", -- "fg" or "bg" or empty
	      keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
	      after = "fg", -- "fg" or "bg" or empty
	      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
	      comments_only = true, -- uses treesitter to match keywords in comments only
	      max_line_len = 400, -- ignore lines longer than this
	      exclude = {}, -- list of file types to exclude highlighting
	    },
	    -- list of named colors where we try to extract the guifg from the
	    -- list of hilight groups or use the hex color if hl not found as a fallback
	    colors = {
	      error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
	      warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
	      info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
	      hint = { "LspDiagnosticsDefaultHint", "#10B981" },
	      default = { "Identifier", "#7C3AED" },
	    },
	    search = {
	      command = "rg",
	      args = {
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
	      },
	      -- regex that will be used to match keywords.
	      -- don't replace the (KEYWORDS) placeholder
	      pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	      -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	    },
	  }
	}
      end
    },
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
    -- NAVIGATION
    --============--
    {
      'unblevable/quick-scope',
      config = function ()
	-- Trigger a highlight in the appropriate direction when pressing these keys:
	vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
	vim.cmd[[
	augroup qs_colors
	autocmd!
	autocmd ColorScheme * highlight QuickScopePrimary guifg=#d3869b gui=underline ctermfg=155 cterm=underline
	autocmd ColorScheme * highlight QuickScopeSecondary guifg=#fabd2f gui=underline ctermfg=81 cterm=underline
	augroup END
	]]
      end
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
    {
      'famiu/bufdelete.nvim',
      config = function ()
	vim.api.nvim_set_keymap('n', '<space>d', ':lua require"bufdelete".bufdelete(0,true)<return>', {silent=true})
      end
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
	vim.cmd[[
	nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
	nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
	nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
	command! B lua require'dap'.toggle_breakpoint()
	" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	command! O lua require'dap'.repl.open()<CR>
	" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
	]]

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
      config = function()
	vim.api.nvim_set_keymap('n', '<space>n',':<c-u>lua require"ts-object-movement".moveby("next_start")<return>', {noremap=true, silent=true})
	vim.api.nvim_set_keymap('n', '<space>N',':<c-u>lua require"ts-object-movement".moveby("next_end")<return>', {noremap=true, silent=true})
	vim.api.nvim_set_keymap('n', '<space>b',':<c-u>lua require"ts-object-movement".moveby("previous_start")<return>', {noremap=true, silent=true})
	vim.api.nvim_set_keymap('n', '<space>B',':<c-u>lua require"ts-object-movement".moveby("previous_end")<return>', {noremap=true, silent=true})
	vim.api.nvim_set_keymap('n', ']',':<c-u>lua require"ts-object-movement".repeatmoveby("next_start")<return>', {noremap=true, silent=true})
	vim.api.nvim_set_keymap('n', '[',':<c-u>lua require"ts-object-movement".repeatmoveby("previous_start")<return>', {noremap=true, silent=true})
      end
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
	vim.api.nvim_set_keymap('n', '<space>il', ':Trouble<cr>', {silent=true})
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
--[[ config = function ()
vim.api.nvim_set_keymap(
'n',
'<space>dic',
':Dict <c-r>=expand("<cword>")<Return><Return>',
{noremap=true}
)
      end, ]]
    },
    {
      'tanvirtin/vgit.nvim',
      requires = 'nvim-lua/plenary.nvim',
    },
--[[ {
'lewis6991/gitsigns.nvim',
-- requires = 'nvim-lua/plenary.nvim',
config =function ()
require'gitsigns_conf'
end,
    }, ]]
    {
      'nvim-treesitter/nvim-treesitter',
      config =function ()
	require'nvim-treesitter.configs'.setup(require'treesitter')
      end,
    },
    {
      'haringsrob/nvim_context_vt',
      config = function ()
	require('nvim_context_vt').setup({
	  custom_text_handler = function (node)
	    local ts_utils = require 'nvim-treesitter.ts_utils'
	    if node ~= ts_utils.get_node_at_cursor() then
	      return nil
	    end
	    return tonumber(ts_utils.get_node_range(node),10) + 1 ..":".. string.sub(ts_utils.get_node_text(node)[1], 0, 10) .. "..."
	  end
	})
      end
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function ()
	vim.g.indent_blankline_context_highlight_list = {'IndentBlankline'}
	vim.g.indent_blankline_use_treesitter = true
	vim.g.indent_blankline_filetype_exclude = {
          'help',
          'TelescopePrompt',
	  'Trouble'
        }
	vim.g.indent_blankline_context_patterns = {
	  'if',
	  'class',
	  'function',
	  'method',
	  'for',
	  'while',
	}
      end
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
      'sindrets/diffview.nvim',
    },
    {
      'nvim-treesitter/playground',
    },
}, config = {} })
