" base nvim mappings

let mapleader = " "
nnoremap <silent><C-n> :bnext<Return>
nnoremap <silent><C-p> :bprevious<Return>
nnoremap <leader>sr :%s/<c-r>=expand("<cword>")<cr>/
