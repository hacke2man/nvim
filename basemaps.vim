" base nvim mappings

" Y now yanks to the end of the line
nnoremap Y y$
nnoremap <c-h> :b

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Up>    :resize -2<CR>
nnoremap <Down>  :resize +2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" A j or k movement with a count greater than 1 is now counted as a jump
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') .'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') .'j'

let mapleader = "\<Space>"
nnoremap <silent><leader>l :bnext<Return>
nnoremap <silent><leader>h :bprevious<Return>

nnoremap <leader>wb :write<Return>
nnoremap <leader>wa :wall<Return>
nnoremap <leader>sr :%s/\v<c-r>=expand("<cword>")<cr>/
nnoremap <leader>n :noh<Return>
nnoremap <leader>bd :bdelete<Return>
nnoremap <leader>qq :quit<Return>
