nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'vim-vsnip'

nnoremap <silent><leader>e :<c-u>lua require'ts-object-movement'.moveby("next_end")<return>
nnoremap <silent><leader>E :<c-u>lua require'ts-object-movement'.moveby("previous_end")<return>
nnoremap <silent><leader>b :<c-u>lua require'ts-object-movement'.moveby("next_start")<return>
nnoremap <silent><leader>B :<c-u>lua require'ts-object-movement'.moveby("previous_start")<return>
" new
nnoremap n nzzzv
nnoremap N Nzzzv

inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ( (<c-g>u
inoremap [ [<c-g>u
inoremap [ [<c-g>u

" FIXME: there has to be a better way
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

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

" Auto Commads
autocmd FileType man setlocal scrolloff=999
autocmd FileType man nnoremap <buffer> \ /^\s*-

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
augroup qs_colors
   autocmd!
   autocmd ColorScheme * highlight QuickScopePrimary guifg=#d3869b gui=underline ctermfg=155 cterm=underline
   autocmd ColorScheme * highlight QuickScopeSecondary guifg=#fabd2f gui=underline ctermfg=81 cterm=underline
augroup END

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
