" fix plug defaults for my setup
"
" Only setting that need to be changed and have no other corrasponding plugin
" file will be put here.

" UltiSnips
" allow coc to use tab for expantion

nnoremap <leader>t :ToggleTerm<Return>
nnoremap <leader>dic :Dict <c-r>=expand("<cword>")<Return><Return>
nnoremap <leader>cc :ConvertColorto 
"colorscheme plug
colorscheme gruvbox

let g:buftabline_indicators = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg='#d3869b' gui=underline ctermfg=34 cterm=underline
highlight QuickScopeSecondary guifg='#fabd2f' gui=underline ctermfg=81 cterm=underline

let g:qs_max_chars=150

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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

au filetype dashboard nnoremap <buffer>q ZZ
au filetype dashboard nnoremap <buffer><leader>q ZZ
" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" telescope config
nnoremap <silent><leader>f :Telescope find_files theme=get_ivy<Return>
" nnoremap <silent><leader>EF :call FullFind()<return>
" nnoremap <silent><leader>fb :Telescope buffers theme=get_dropdown<Return><esc>
" nnoremap <silent><leader>fg :Telescope git_status theme=get_dropdown<Return>
nnoremap <silent><leader>s :Telescope live_grep theme=get_ivy<Return>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

function FullFind()
  cd $HOME
  Telescope find_files theme=get_dropdown
endfunction
nnoremap <Leader>un :UndotreeToggle<Return>:

let g:victionary#map_defaults = 0

nnoremap <Leader>dic <Plug>(victionary#define_under_cursor)

function AuPair()
  lua reqire 'nvim-autopairs'.autopairs_cr()
endfunction

