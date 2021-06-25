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
