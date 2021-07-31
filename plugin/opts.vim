nnoremap <silent><leader>e :<c-u>lua require'ts-object-movement'.moveby("next_end")<return>
nnoremap <silent><leader>E :<c-u>lua require'ts-object-movement'.moveby("previous_end")<return>
nnoremap <silent><leader>b :<c-u>lua require'ts-object-movement'.moveby("next_start")<return>
nnoremap <silent><leader>B :<c-u>lua require'ts-object-movement'.moveby("previous_start")<return>

" Functions
omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>
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
    if(f == "NvimTree")
       lua require'buftree'.close()
       return
    endif
    if (bufNum == 1)
       q
    else
       bd
    endif
endfunction

hi SignColumn guibg=#282828

" Auto Commads
autocmd FileType man setlocal scrolloff=999
autocmd FileType man nnoremap <buffer> \ /^\s*-

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let bufferline = get(g:, 'bufferline', {})
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_filetype_exclude = ['help']
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_space_char = ' '
let g:indent_blankline_space_char_blankline = ' '
let g:indent_blankline_buftype_exclude = ['TelescopePrompt']
