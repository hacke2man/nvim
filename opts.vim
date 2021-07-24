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

let g:dashboard_custom_section={
         \ 'a': {
         \ 'description': ['Frecency'],
         \ 'command': "Telescope frecency theme=get_ivy" },
         \ 'b': {
         \ 'description': ['find file'],
         \ 'command': "Telescope find_files theme=get_ivy" },
         \ 'c': {
         \ 'description': ['init'],
         \ 'command': "edit ~/.config/nvim/init.lua" },
         \ }

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

