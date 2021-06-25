" Nvim Configuration
" IDEAS
" 1.make telescope mapping for adding a file as a split
" 2.make mapping for closing split without deleting buffer

source ~/.config/nvim/settings.vim
source ~/.config/nvim/basemaps.vim
source ~/.config/nvim/autocomands.vim

lua require('plugins')
lua require('lsp')
lua require('compeConf')

" Plugin Configuration
source ~/.config/nvim/plugin_configs/plug_adjust.vim
source ~/.config/nvim/plugin_configs/quickscope.vim
source ~/.config/nvim/plugin_configs/start_screen.vim
source ~/.config/nvim/plugin_configs/undotree.vim
source ~/.config/nvim/plugin_configs/laf.vim
source ~/.config/nvim/plugin_configs/telescope.vim

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
