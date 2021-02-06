" base nvim mappings

" Y now yanks to the end of the line
noremap Y y$

" A j or k movement with a count greater than 1 is now counted as a jump
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') .'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') .'j'

let mapleader = " "
nnoremap <silent><leader>l :bnext<Return>
nnoremap <silent><leader>h :bprevious<Return>
nnoremap <silent><leader>w :w<Return>
nnoremap <leader>sr :%s/<c-r>=expand("<cword>")<cr>/
nnoremap <leader>n :noh<Return>
