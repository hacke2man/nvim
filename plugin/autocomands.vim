autocmd FileType man set scrolloff=999
autocmd FileType man nnoremap <buffer> \ /^\s*-

autocmd BufWritePost *.ms silent !groff -ms % > %.ps
autocmd BufWritePost *.me silent !groff -me % > %.ps

autocmd BufEnter * call ReadChecks()
autocmd BufEnter *.vs setfiletype glsl

function ReadChecks()
    if &filetype == "term"
        normal i
    endif
endfunction
