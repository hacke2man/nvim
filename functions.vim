function! ChooseBuffer(buffername)
    let bnr = bufwinnr(a:buffername)
    if bnr > 0
       :exe bnr . "wincmd w"
    else
       echo a:buffername . ' is not existent'
       silent execute 'split ' . a:buffername
    endif
 endfunction
