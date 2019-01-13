" run
function! extension#common#run(cmd, path, ...)
    call extension#common#writeAll()

    echo ' '

    let cmd = a:cmd . ' ' . a:path . ' ' . join(a:000, ' ')

    echo cmd
    echo ' '

    for line in lib#system#asList(cmd)
        echo line | endfor

    echo ' '
endfunction

function! extension#common#writeAll()
    let current = tabpagenr()

    tabdo call lib#buffer#close('%', 'w', '')

    execute 'normal ' . current . 'gt'
endfunction

" snipet
function! extension#common#snipet(lines)
    let line = type(a:lines) == type([]) ? join(a:lines, '') : a:lines
    execute 'normal O' . line . ''
endfunction

" comment
function! extension#common#commentize(mark) range
    for n in range(a:firstline, a:lastline)
        call s:commentize(a:mark, n) | endfor
endfunction

function! extension#common#decommentize(mark) range
    for n in range(a:firstline, a:lastline)
        call s:decommentize(a:mark, n) | endfor
endfunction

function! extension#common#switch(mark) range
    for n in range(a:firstline, a:lastline)
        if s:isCommentized(a:mark, n) | call s:decommentize(a:mark, n)
        else                          | call s:commentize(a:mark, n)   | endif | endfor
endfunction

function! s:commentize(mark, n)
    execute a:n
    execute 'normal 0i' . a:mark . ' '
endfunction

function! s:decommentize(mark, n)
    execute a:n
    if s:isCommentized(a:mark, a:n)
        execute 'normal 0' . repeat('x', len(a:mark) + 1) | endif
endfunction

function! s:isCommentized(mark, n)
    return getline(a:n) =~# '^' . a:mark . ' '
endfunction
