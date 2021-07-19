" Nvim Configuration
" IDEAS
" 1.make telescope mapping for adding a file as a split
" 2.make mapping for closing split without deleting buffer

" lua require('snipconf')
" lua require('lua-ls')
lua require('plugins')
lua require('lsp')
lua require('compeConf')
lua require('treesitter')
lua require('settings')
lua require('autopairs')
lua require('dapConf')

command Soi source ~/.config/nvim/init.*
command P echo expand("%:p")
