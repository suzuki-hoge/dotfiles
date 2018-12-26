" enter
function! extension#haskell#enter()
    " run
    command! -nargs=* W call extension#common#run('stack runghc', expand('%'), <f-args>)

    " comment
    nnoremap ÷ :call extension#common#commentize('--')<CR>
    vnoremap ÷ :call extension#common#commentize('--')<CR>

    nnoremap ? :call extension#common#decommentize('--')<CR>
    vnoremap ? :call extension#common#decommentize('--')<CR>

    nnoremap ¿ :call extension#common#switch('--')<CR>
    vnoremap ¿ :call extension#common#switch('--')<CR>

    " snipet

    " tool
    command! TlLint call extension#haskell#lint()
endfunction

" leave
function! extension#haskell#leave()
    " run
    delcommand W

    " comment
    nunmap ÷
    vunmap ÷

    nunmap ?
    vunmap ?

    nunmap ¿
    vunmap ¿

    " snipet

    " tool
    delcommand TlLint
endfunction

" run

" snipet

" tool
function! extension#haskell#lint()
    call extension#common#run('hlint', expand('%'))
endfunction
