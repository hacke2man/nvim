-- Nvim settings
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
-- vim.opt.ColorColumn ctermbg=darkgray
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
-- vim.opt.shiftwidth = 4
-- vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"
vim.opt.incsearch = true
-- vim.opt.set foldmethod=syntax
vim.opt.foldlevelstart = 100
vim.opt.wildmenu = true
vim.opt.wildignore = vim.opt.wildignore + "/home/liam/**/node_modules/**"
vim.opt.wildignore = vim.opt.wildignore + "/home/liam/**/plugged/**"
-- vim.opt.matchpairs = vim.opt.wildignore + ':'

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.undodir = "/home/liam/.cache/vimundo"
-- " complete
-- " completeopt
-- " fileformats
-- " guifont, guifontset

-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 2

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.opt.signcolumn = "yes"
-- vim.opt.listchars = {trail = '~', extends = '>', precedes = '<', tab = '>-'}
vim.opt.listchars = "trail:~,extends:>,precedes:<,tab:>-"
vim.opt.list = true
vim.opt.fillchars = "fold: "
vim.opt.termguicolors = true

-- Original file
-- " Nvim settings

-- " filetype plugin on
-- " syntax on
-- set nowrap
-- set relativenumber
-- set nu
-- set colorcolumn=80
-- hi ColorColumn ctermbg=darkgray
-- set scrolloff=8
-- set sidescrolloff=10
-- set signcolumn=yes
-- au TextYankPost * silent! lua vim.highlight.on_yank()

-- set autoindent
-- set expandtab
-- set shiftround
-- set shiftwidth=4
-- set smarttab

-- set clipboard+=unnamedplus
-- set incsearch
-- " set foldmethod=syntax
-- set foldlevelstart=100
-- set wildmenu
-- set wildignore+=/home/liam/**/node_modules/**
-- set wildignore+=/home/liam/**/plugged/**
-- set matchpairs+=':'

-- set splitbelow
-- set splitright

-- set noswapfile
-- set visualbell
-- set cursorline
-- set undofile
-- set undodir=/home/liam/.cache/vimundo
-- " complete
-- " completeopt
-- " fileformats
-- " guifont, guifontset

-- " TextEdit might fail if hidden is not set.
-- set hidden

-- " Some servers have issues with backup files, see #649.
-- set nobackup
-- set nowritebackup

-- " Give more space for displaying messages.
-- set cmdheight=2

-- " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- " delays and poor user experience.
-- set updatetime=300

-- " Don't pass messages to |ins-completion-menu|.
-- set shortmess+=c

-- " Always show the signcolumn, otherwise it would shift the text each time
-- " diagnostics appear/become resolved.
-- if has("patch-8.1.1564")
--   " Recently vim can merge signcolumn and number column into one
--   set signcolumn=number
-- else
--   set signcolumn=yes
-- endif

-- set listchars=trail:~,extends:>,precedes:<,tab:>-
-- set list
-- set fillchars=fold:\ 
-- set termguicolors
