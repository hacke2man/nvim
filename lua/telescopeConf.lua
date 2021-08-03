local fd_opts = '{find_command={"fd",".","--type","f","--one-file-system","--hidden","--ignore-file=' .. vim.env.HOME .. '/.gitignore"}}'

local theme = function(opts)
  return 'require"telescope.themes".get_ivy(' .. opts .. ')'
end

local ff = ':lua require"telescope.builtin".find_files(' .. theme(fd_opts) .. ')<return>'
vim.api.nvim_set_keymap(
  'n',
  '<space>f',
  -- ':Telescope find_files theme=get_ivy<Return>',
  ff,
  {noremap = true, silent = true}
)

vim.api.nvim_set_keymap(
  'n',
  '<space>s',
  ':Telescope live_grep theme=get_ivy<Return>',
  {noremap = true, silent = true}
)

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      -- '--hidden',
      '--ignore-file=/liam/home/.gitignore',
      '--one-file-system',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    extensions = {
      fzy_native = {
        override_generic_sorter = true,
        override_file_sorter = true,
      }
    }
  }
}

require('telescope').load_extension('fzy_native')
