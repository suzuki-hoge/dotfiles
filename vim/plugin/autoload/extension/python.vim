" enter
function! extension#python#enter()
    " run
    command! -nargs=* W call extension#common#run('python -B', expand('%'), <f-args>)

    " comment
    nnoremap ÷ :call extension#common#commentize('#')<CR>
    vnoremap ÷ :call extension#common#commentize('#')<CR>

    nnoremap ? :call extension#common#decommentize('#')<CR>
    vnoremap ? :call extension#common#decommentize('#')<CR>

    nnoremap ¿ :call extension#common#switch('#')<CR>
    vnoremap ¿ :call extension#common#switch('#')<CR>

    " snipet
    command!          SniUtf8   call extension#python#utf8()
    command! -nargs=1 SniFile   call extension#python#file(<f-args>)
    command!          SniStdout call extension#python#stdout()

    " tool

endfunction

" leave
function! extension#python#leave()
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
    delcommand SniUtf8
    delcommand SniFile
    delcommand SniStdout

    " tool

endfunction

" run

" snipet
function! extension#python#utf8()
    call extension#common#snipet(
\       '# -*- coding: utf-8 -*-'
\   )
endfunction

function! extension#python#file(mode)
    call extension#common#snipet([
\       "with open(path, '" . a:mode . "') as f:",
\       'lines = f.read().splitlines()'
\   ])
endfunction

function! extension#python#stdout()
    call extension#common#snipet([
\       'import sys, codecs',
\       "sys.stdout = codecs.getwriter('utf-8')(sys.stdout)"
\   ])
endfunction

"tool

