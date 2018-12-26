" enter
function! extension#vim#enter()
    " run
    command! W call extension#vim#run()

    " comment
    nnoremap ÷ :call extension#common#commentize('"')<CR>
    vnoremap ÷ :call extension#common#commentize('"')<CR>

    nnoremap ? :call extension#common#decommentize('"')<CR>
    vnoremap ? :call extension#common#decommentize('"')<CR>

    nnoremap ¿ :call extension#common#switch('"')<CR>
    vnoremap ¿ :call extension#common#switch('"')<CR>

    " snipet

    " tool

endfunction

" leave
function! extension#vim#leave()
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
function! extension#vim#run()
    call extension#common#writeAll()
    redraw
    execute 'source %'
endfunction

" snipet

"tool

