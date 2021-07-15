-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

-- vim.cmd "![ -d ~/.local/share/nvim/site/pack/packer/start/packer.nvim ] &&
--     \ git clone https://github.com/wbthomason/packer.nvim\
--     \ ~/.local/share/nvim/site/pack/packer/start/packer.nvim
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua
-- vim.cmd "autocmd BufWritePost plugins.lua source $VIM:|PackerSync"
vim.cmd "autocmd BufWritePost plugins.lua call system('[ -f ~/.cache/nvim/update_plugins ] || touch ~/.cache/nvim/update_plugins')"
vim.cmd "autocmd VimEnter * call Sync()"

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

-- editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'terryma/vim-multiple-cursors'
    use 'amadeus/vim-convert-color-to'
    -- use 'norcalli/snippets.nvim'
    use 'SirVer/ultisnips'
    use 'windwp/nvim-autopairs'

-- laf
    use 'gruvbox-community/gruvbox'
    use 'shinchu/lightline-gruvbox.vim'
    -- use 'mhinz/vim-startify'
    use 'glepnir/dashboard-nvim'

-- Navigation
    use 'unblevable/quick-scope'
    use 'nvim-telescope/telescope.nvim'

-- backend
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'airblade/vim-rooter'
    use 'tpope/vim-sleuth'
    use {'neovim/nvim-lspconfig', opt = false}
    use {"hrsh7th/nvim-compe", opt = false}
    use 'tamago324/compe-zsh'
    use 'kabouzeid/nvim-lspinstall'
    use 'mfussenegger/nvim-dap'
    use 'moll/vim-bbye'
    use 'aymericbeaumet/vim-symlink'

-- Practice
    use 'ThePrimeagen/vim-be-good'

-- info
    use 'norcalli/nvim-colorizer.lua'
    use 'szw/vim-dict'
    use 'ap/vim-buftabline'
    use 'itchyny/lightline.vim'
    use 'mhinz/vim-signify'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nathanaelkane/vim-indent-guides'
    use 'vim-scripts/mom.vim'

end)
