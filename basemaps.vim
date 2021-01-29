" base nvim mappings

let mapleader = " "
nnoremap <silent><leader>l :bnext<Return>
nnoremap <silent><leader>h :bprevious<Return>
nnoremap <silent><leader>w :w<Return>
nnoremap <leader>sr :%s/<c-r>=expand("<cword>")<cr>/
