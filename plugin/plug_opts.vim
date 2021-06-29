" fix plug defaults for my setup
"
" Only setting that need to be changed and have no other corrasponding plugin
" file will be put here.

" UltiSnips
" allow coc to use tab for expantion
let g:UltiSnipsExpandTrigger='<C-e>'

nnoremap <leader>cc :ConvertColorto 
"colorscheme plug
colorscheme gruvbox

" indent guide plug
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  guibg=bg
let g:indent_guides_exclude_filetypes = ['startify', 'vim', 'term', 'help', 'no ft', 'man', 'mail']

let g:buftabline_indicators = 1

" info plug
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'right': [ [ 'percent' ], [ 'filetype'] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_dir = 0
let g:startify_lists = [
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]

nnoremap <silent><c-s> <c-w><c-o>:bd<Return>:Startify<Return>

" telescope config

nnoremap <silent><leader>ef :Telescope find_files theme=get_dropdown<Return>
nnoremap <silent><leader>EF :call FullFind()<return>

nnoremap <silent><leader>fb :Telescope buffers theme=get_dropdown<Return><esc>

nnoremap <silent><leader>fg :Telescope git_status theme=get_dropdown<Return>

nnoremap <silent><leader>fs :Telescope live_grep theme=get_dropdown<Return>

nnoremap <leader>fh <cmd>Telescope help_tags<cr>

function FullFind()
  cd $HOME
  Telescope find_files theme=get_dropdown
endfunction
nnoremap <Leader>un :UndotreeToggle<Return>:

let g:victionary#map_defaults = 0

nnoremap <Leader>dic <Plug>(victionary#define_under_cursor)
