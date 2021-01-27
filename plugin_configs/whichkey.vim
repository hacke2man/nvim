" whichkey config

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent><leader> :WhichKey '<space>'<Return>
let g:which_key_map = {}

let g:which_key_map.s = { 'name' : 'which_key_ignore' }
let g:which_key_map.sr = 'Search-and-replace'

let g:which_key_map.a = 'React-refactor'

let g:which_key_map.b = 'Buffers'

let g:which_key_map.f = 'Project-files'

let g:which_key_map.p = 'Prettier'

let g:which_key_map.g = 'Project-grep'

let g:which_key_map.ga = 'Git-actions'

let g:which_key_map.gs = 'Git-status'

let g:which_key_map.y = 'Yank-list'

let g:which_key_map.c = {
  \ 'name' : '+Coc',
  \ 'e' : 'Extensions',
  \ 'sw' : 'Search word',
  \ } 
