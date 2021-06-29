" base nvim mappings

"unmaps
nnoremap Q <nop>

"helper func
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" abbrev
cnoreabbrev soi source ~/.config/nvim/init.vim
cnoreabbrev run !./a.out
cnoreabbrev ein e ~/.config/nvim/init.vim
cnoreabbrev e. e ./
cnoreabbrev ee e ./**/<c-r>=Eatchar('\s')<Return>

" Y now yanks to the end of the line
nnoremap Y y$
" yank entire file file.
nnoremap yaa :%y<Return>

" V selects to the end of a end
nnoremap V v$h
" vv selects linewise NOTE: vV also still works
xnoremap v <esc>0v$
" P in escence does not copy overwritten selection
xnoremap P pgvy

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

nnoremap ml :execute "vert sb" bufnr('%')+1<return>
nnoremap mh :execute "vert leftabove sb" bufnr('%')-1<return>

let mapleader = "\<Space>"
nnoremap <silent><leader>l :bnext<Return>
nnoremap <silent><leader>h :bpreviou<Return>

nnoremap <leader>w :write<Return>
nnoremap <leader>sr :%s/\v<c-r>=expand("<cword>")<Return>/
nnoremap <leader>dic :Dict <c-r>=expand("<cword>")<Return><Return>
nnoremap <leader>n :noh<Return>
nnoremap <leader>q :call Quit()<Return>
nnoremap <leader>mr :call Mun()<Return>
nnoremap <leader>ee :edit ./**/
nnoremap <leader>t :call Tfunc()<Return>
nnoremap <leader>dup :!dupe<return>
nnoremap <leader>j jzz
nnoremap <leader>k kzz
nnoremap <leader><c-o> <c-o>zz
nnoremap <leader><c-i> <c-i>zz
nnoremap <leader>r :call Run()<return>
nnoremap <silent><leader>ch :cd %:p:h<return>
tnoremap <c-k> <c-\><c-n>
tnoremap <c-l> <c-\><c-n>:bnext<return>
tnoremap <c-h> <c-\><c-n>:bprevious<return>

" Functions
function Run()
    let out=system(getline('.'))
    norm ddk
    put =out
endfunction

function Tfunc()
    terminal
    setfiletype term
    setlocal signcolumn=no
    norm i
endfunction

function Mun()
    !make && ./a.out
endfunction

function Quit()
    let bufNum=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    if (bufNum == 1)
       q
    else
        if (&filetype == "term")
            bd!
        else
            bd
        endif
    endif
endfunction

function Sync()
    let thing = $HOME
    if filereadable(join([$HOME,".cache/nvim/update_plugins"] ,"/"))
        PackerSync
        call system('rm ~/.cache/nvim/update_plugins')
    endif
endfunction

function ReadChecks()
    if &filetype == "term"
        normal i
    endif
endfunction

" Auto Commads
autocmd FileType man set scrolloff=999
autocmd FileType man nnoremap <buffer> \ /^\s*-

autocmd BufWritePost *.ms silent !groff -ms % > %.ps
autocmd BufWritePost *.me silent !groff -me % > %.ps

autocmd BufEnter * call ReadChecks()
autocmd BufEnter *.vs setfiletype glsl
