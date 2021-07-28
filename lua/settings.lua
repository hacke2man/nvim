-- Nvim settings
vim.opt.wrap = false
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.colorcolumn = "80"
-- vim.opt.showmode = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 10
vim.opt.signcolumn = "yes"
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank()")

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
-- vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"
vim.opt.incsearch = true
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 100
vim.opt.wildmenu = true
vim.opt.wildignore = vim.opt.wildignore + "/home/liam/**/node_modules/**"
vim.opt.wildignore = vim.opt.wildignore + "/home/liam/**/plugged/**"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.swapfile = false
vim.opt.visualbell = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.undodir = "/home/liam/.cache/vimundo"

-- TextEdit might fail if hidden is not set.
vim.opt.hidden = true

-- Some servers have issues with backup files, see #649.
vim.opt.backup = false
vim.opt.writebackup = false

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess = vim.opt.shortmess + "c"

vim.opt.signcolumn = "number"
-- vim.opt.listchars = {trail = '~', extends = '>', precedes = '<', tab = '>-'}
vim.opt.listchars = "trail:·,extends:>,precedes:<,tab:>-"
vim.opt.list = true
vim.opt.fillchars = "fold: ,vert:█"
-- vim.cmd[[hi VertSplit guifg='#cc241d']]
vim.opt.termguicolors = true

-- base nvim mappings
vim.cmd[[nnoremap Q <nop>]]

-- unmaps
vim.cmd[[command Ein edit $HOME/.config/nvim/init.lua]]
vim.cmd[[command Soi source ~/.config/nvim/init.lua]]
vim.cmd[[command P echo expand("%:p")]]

-- Y now yanks to the end of the line
vim.cmd[[nnoremap Y y$]]
-- yank entire file file.
vim.cmd[[nnoremap yaa :%y<Return>]]
vim.cmd[[nnoremap daa :%d<Return>]]

-- V selects to the end of a end
vim.cmd[[nnoremap V v$]]
-- vv selects linewise NOTE: vV also still works
vim.cmd[[xnoremap v <esc>0v$]]
-- P in escence does not copy overwritten selection
vim.cmd[[xnoremap P pgvy]]

-- Better window navigation
vim.cmd[[nnoremap <C-h> <C-w>h]]
vim.cmd[[nnoremap <C-j> <C-w>j]]
vim.cmd[[nnoremap <C-k> <C-w>k]]
vim.cmd[[nnoremap <C-l> <C-w>l]]

vim.cmd[[nnoremap <Up>    :resize -2<CR>]]
vim.cmd[[nnoremap <Down>  :resize +2<CR>]]
vim.cmd[[nnoremap <Left>  :vertical resize -2<CR>]]
vim.cmd[[nnoremap <Right> :vertical resize +2<CR>]]

-- A j or k movement with a count greater than 1 is now counted as a jump
vim.cmd[[nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') .'k']]
vim.cmd[[nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') .'j']]

vim.cmd[[nnoremap ml :execute "vert sb" bufnr('%')+1<return>]]
vim.cmd[[nnoremap mh :execute "vert leftabove sb" bufnr('%')-1<return>]]

vim.cmd[[let mapleader = "\<Space>"]]
-- vim.cmd[[nnoremap <silent><leader>l :bnext<Return>]]
-- vim.cmd[[nnoremap <silent><leader>h :bprevious<Return>]]

vim.cmd[[nnoremap <leader><return> :<up><return>]]
vim.cmd[[nnoremap <leader>w :write<Return>]]
vim.cmd[[nnoremap <leader>n :noh<Return>]]
vim.cmd[[nnoremap <leader>q :call Quit()<Return>]]
vim.cmd[[nnoremap <leader>e :e ]]
vim.cmd[[nnoremap <leader>dup :!dupe<return>]]
vim.cmd[[nnoremap <leader>j jzz]]
vim.cmd[[nnoremap <leader>k kzz]]
vim.cmd[[nnoremap <leader><c-o> <c-o>zz]]
vim.cmd[[nnoremap <leader><c-i> <c-i>zz]]
vim.cmd[[nnoremap <silent><leader>ch :cd %:p:h<return>]]
vim.cmd[[tnoremap <c-k> <c-\><c-n>]]
vim.cmd[[tnoremap <c-l> <c-\><c-n>:bnext<return>]]
vim.cmd[[tnoremap <c-h> <c-\><c-n>:bprevious<return>]]

vim.cmd[[inoremap <c-a> <esc>A]]

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
