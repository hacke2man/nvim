require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAdd'   , linehl='GitSignsAddNr'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChange', linehl='GitSignsChange'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDelete', linehl='GitSignsDelete'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDelete', linehl='GitSignsDelete'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChange', linehl='GitSignsChange'},
  },
  numhl = false,
  linehl = false,
  signcolumn = false,
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>Hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>Hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>Hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>Hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>Hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>HR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>Hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>Hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ['n <leader>Ht'] = '<cmd>lua require"gitsigns".toggle_signs()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame = false,
  current_line_blame_delay = 1000,
  current_line_blame_position = 'eol',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  use_internal_diff = true,  -- If luajit is present
}
