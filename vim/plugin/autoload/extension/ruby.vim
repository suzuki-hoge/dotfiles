" enter
function! extension#ruby#enter()
    " run
    command! -nargs=* W call extension#common#run('ruby', expand('%'), <f-args>)

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
function! extension#ruby#leave()
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

"tool

