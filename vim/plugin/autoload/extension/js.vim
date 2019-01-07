" enter
function! extension#js#enter()
    " run
    command! W call extension#js#run()

    " comment
    nnoremap ÷ :call extension#common#commentize('//')<CR>
    vnoremap ÷ :call extension#common#commentize('//')<CR>

    nnoremap ? :call extension#common#decommentize('//')<CR>
    vnoremap ? :call extension#common#decommentize('//')<CR>

    nnoremap ¿ :call extension#common#switch('//')<CR>
    vnoremap ¿ :call extension#common#switch('//')<CR>

    " snipet

    " tool

endfunction

" leave
function! extension#js#leave()
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

endfunction

" run
function! extension#js#run()
    call extension#common#writeAll()
    call lib#system#call($dot . '/apps/reload.app/Contents/MacOS/applet')
endfunction

" snipet

" tool

