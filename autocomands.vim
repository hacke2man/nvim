au FileType man set scrolloff=999

au BufWritePost *.ms silent !groff -ms % > %.ps
au BufWritePost *.me silent !groff -me % > %.ps

autocmd BufEnter * call ReadChecks()
autocmd BufEnter *.vs setfiletype glsl

function ReadChecks()
    if &filetype == "term"
        normal i
    endif
endfunction
