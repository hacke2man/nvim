" base nvim mappings
" set tabline=2
" au bufenter,bufmodifiedset * lua require

command Ein edit $HOME/.config/nvim/init.vim
command Soi source ~/.config/nvim/init.*
command P echo expand("%:p")

"unmaps
nnoremap Q <nop>

"helper func
func Eatchar(pat)
   let c = nr2char(getchar(0))
   return (c =~ a:pat) ? '' : c
endfunc

" abbrev
cnoreabbrev soi source ~/.config/nvim/init.vim
cnoreabbrev ein e ~/.config/nvim/init.vim

" Y now yanks to the end of the line
nnoremap Y y$
" yank entire file file.
nnoremap yaa :%y<Return>
nnoremap daa :%d<Return>

" V selects to the end of a end
nnoremap V v$
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
nnoremap <silent><leader>h :bprevious<Return>

nnoremap <leader><return> :<up><return>
nnoremap <leader>w :write<Return>
nnoremap <leader>n :noh<Return>
nnoremap <leader>q :call Quit()<Return>
nnoremap <leader>e :e 
nnoremap <leader>dup :!dupe<return>
nnoremap <leader>j jzz
nnoremap <leader>k kzz
nnoremap <leader><c-o> <c-o>zz
nnoremap <leader><c-i> <c-i>zz
nnoremap <silent><leader>ch :cd %:p:h<return>
tnoremap <c-k> <c-\><c-n>
tnoremap <c-l> <c-\><c-n>:bnext<return>
tnoremap <c-h> <c-\><c-n>:bprevious<return>

inoremap <c-a> <esc>A

" Functions
command -nargs=1 Rename :call RenameFile(<f-args>)
command -nargs=1 R :call RenameFile(<f-args>)
function RenameFile(var)
   let str=a:var
   let path=expand("%:p")
   let fold=expand("%:p:h")
   let check=system("[ -f " . path ." ] || echo -n false")

   if check == "false"
      call system("touch " . path)
   endif

   echo system("mv " . path . " " . fold . "/" . str)
   bd
   call nvim_command("edit" . fold . "/" . str)
endfunction


command Delete call Delete()
function Delete()
   let path=expand("%:p")
   let fold=expand("%:p:h")
   let check=system("[ -f " . path ." ] || echo -n false")

   if check == "false"
      call system("touch " . path)
   endif

   echo system("rm " . path)
   bd!
endfunction

function Quit()
    let bufNum=len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    if (bufNum == 1)
       q
    else
       bd
    endif
endfunction

" Auto Commads
autocmd FileType man setlocal scrolloff=999
autocmd FileType man nnoremap <buffer> \ /^\s*-

autocmd BufWritePost *.ms silent !groff -ms % > %.ps
autocmd BufWritePost *.me silent !groff -me % > %.ps

autocmd BufEnter *.vs setfiletype glsl
