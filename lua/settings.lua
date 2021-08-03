local o = vim.opt
local c = vim.cmd
-- Nvim settings
o.compatible = false
o.wrap = false
o.relativenumber = true
o.number = true
o.colorcolumn = "80"
o.scrolloff = 8
o.sidescrolloff = 10
o.signcolumn = "yes"
c("au TextYankPost * silent! lua vim.highlight.on_yank()")

o.autoindent = true
o.expandtab = true
o.shiftround = true
o.shiftwidth = 2

o.clipboard = "unnamedplus"
o.incsearch = true
o.foldmethod = "syntax"
o.foldlevelstart = 100
o.wildmenu = true
o.wildignore:append "/**/node_modules/**"

o.splitbelow = true
o.splitright = true

o.swapfile = false
o.visualbell = true
o.cursorline = true
o.undofile = true
o.undodir = vim.env.XDG_CACHE_HOME .. "/vimundo"

-- TextEdit might fail if hidden is not set.
o.hidden = true

-- Some servers have issues with backup files, see #649.
o.backup = false
o.writebackup = false

-- Give more space for displaying messages.
o.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
o.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
o.completeopt="menuone,noinsert,noselect"
o.shortmess:append"c"

o.signcolumn = "number"
o.listchars = "trail:·,extends:>,precedes:<,tab:>-"
o.list = true
o.fillchars = "fold: ,vert:█"
o.termguicolors = true

local map = vim.api.nvim_set_keymap
local nos = { noremap=true, silent=true }
vim.g.mapleader=" "

c[[command Ein edit $HOME/.config/nvim/init.lua]]
c[[command Soi source ~/.config/nvim/init.lua]]
c[[command P echo expand("%:p")]]

-- unmaps
map('n', 'Q', '<nop>', nos)

-- Y now yanks to the end of the line
map('n', 'Y', 'y$', nos)

-- yank entire file file.
map('n', 'yaa', ':%y<return>', nos)
map('n', 'daa', ':%d<return>', nos)

-- V selects to the end of a end
map('n', 'V', 'v$', nos)
-- vv selects linewise NOTE: vV also still works
map('x', 'v', '<esc>0v$',nos)
-- P in escence does not copy overwritten selection
map('x', 'P', 'pgvy', nos)

-- Better window navigation
map('n', '<C-h>', '<C-w>h', nos)
map('n', '<C-j>', '<C-w>j', nos)
map('n', '<C-k>', '<C-w>k', nos)
map('n', '<C-l>', '<C-w>l', nos)

map('i', '<c-l>', '<right>', nos)

-- A j or k movement with a count greater than 1 is now counted as a jump
map('n', 'k', [[(v:count > 1 ? "m'" . v:count : '') .'k']], {expr=true, noremap=true})
map('n', 'j', [[(v:count > 1 ? "m'" . v:count : '') .'j']], {expr=true, noremap=true})

-- Buffer
map('n', '<space>v', ':vs<return>', nos)
map('n', '<space>l', ':BufferNext', nos)
map('n', '<space>h', ':BufferPrevious', nos)

-- Leader
map('n', '<space>', '', nos)
map('n', '<space><return>', ':<up><return>]', nos)
map('n', '<space>w', ':write<Return>', nos)
map('n', '<space>q', ':call Quit()<Return>', nos)

c[[inoremap <c-a> <esc>A]]

-- Auto Commads
c"autocmd FileType man setlocal scrolloff=999"
c"autocmd FileType man nnoremap <buffer> \\ /^\\s*-"

-- new
map('n', 'n', 'nzzzv', nos)
map('n', 'N', 'Nzzzv', nos)

map('i', '.', '.<c-g>u', nos)
map('i', ',', ',<c-g>u', nos)
map('i', '(', '(<c-g>u', nos)
map('i', '[', '[<c-g>u', nos)
map('i', '[', '[<c-g>u', nos)

map('v', 'J', [[:<c-u>call execute("'\<,'\>m '>+".(v:count1))<cr>gv=gv]], nos)
map('v', 'K', [[:<c-u>call execute("'\<,'\>m '<-".(v:count1+1))<cr>gv=gv]], nos)
map('n', '<c-j>', [[:<c-u>call execute("m .+".(v:count1))<return>]], nos)
map('n', '<c-k>', [[:<c-u>call execute("m .-".(v:count1+1))<return>]], nos)

