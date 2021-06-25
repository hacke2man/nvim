" Nvim Configuration
" IDEAS
" 1.make telescope mapping for adding a file as a split
" 2.make mapping for closing split without deleting buffer

lua require('plugins')
lua require('lsp')
lua require('compeConf')

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
