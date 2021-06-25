-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

-- editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'terryma/vim-multiple-cursors'
    use 'amadeus/vim-convert-color-to'

-- laf
    use 'gruvbox-community/gruvbox'
    use 'shinchu/lightline-gruvbox.vim'
    use 'itchyny/lightline.vim'
    use 'mhinz/vim-signify'
    use 'mhinz/vim-startify'
    use 'sheerun/vim-polyglot'
    use 'nathanaelkane/vim-indent-guides'
    use 'https://github.com/vim-scripts/mom.vim'

-- movement
    use 'unblevable/quick-scope'

-- backend?
    use 'tpope/vim-repeat'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'airblade/vim-rooter'
    use 'tpope/vim-sleuth'
    use {'neovim/nvim-lspconfig', opt = false}
    use {"hrsh7th/nvim-compe", opt = false}
    use 'SirVer/ultisnips'
    use 'tamago324/compe-zsh'

-- idk intrusive stuff?
    use 'ThePrimeagen/vim-be-good'
    use 'junegunn/gv.vim'
    use 'nvim-telescope/telescope.nvim'

-- info
    use 'norcalli/nvim-colorizer.lua'
    use 'szw/vim-dict'
    use 'ap/vim-buftabline'

end)
