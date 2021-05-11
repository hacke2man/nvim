au FileType man set scrolloff=999

autocmd BufReadPre,FileReadPre *.vs setfiletype glsl
au BufWritePost *.ms silent !groff -ms % > %.ps
au BufWritePost *.me silent !groff -me % > %.ps

autocmd BufEnter * call ReadChecks()

function ReadChecks()
    if &filetype == "term"
        normal i
    endif
endfunction
