--rewrite in lua
vim.cmd[[
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
   let f = expand(&filetype)
   if (bufNum == 1)
      q
   else
      bd
   endif
endfunction

function Sync()
   let ret = system("[ -f ~/.cache/nvim/update_plugins ] && echo -n UPDATE")
   if ret == "UPDATE"
      PackerSync
      call system("rm ~/.cache/nvim/update_plugins")
   endif
endfunction
]]
