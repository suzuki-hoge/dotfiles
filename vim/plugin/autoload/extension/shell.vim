" enter
function! extension#shell#enter()
    " run
    command! -nargs=* W call extension#common#run('sh', expand('%'), <f-args>)

    " comment
    nnoremap ÷ :call extension#common#commentize('#')<CR>
    vnoremap ÷ :call extension#common#commentize('#')<CR>

    nnoremap ? :call extension#common#decommentize('#')<CR>
    vnoremap ? :call extension#common#decommentize('#')<CR>

    nnoremap ¿ :call extension#common#switch('#')<CR>
    vnoremap ¿ :call extension#common#switch('#')<CR>

    " snipet

    " tool

endfunction

" leave
function! extension#shell#leave()
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

" snipet

" tool

