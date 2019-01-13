function! complete#main#main(findstart, base)
    if a:findstart
        return match(
\           strpart(getline('.'), 0, col('.') - 1),
\           '[a-zA-Z0-9-_]*$'
\       )
    else
        let pattern = '^' . lib#list#list(a:base).map("a:x . '.*'").join('')

        for word in s:allWords()
            if word =~# pattern
                call complete_add({'word' : word})
            endif
        endfor
    endif
endfunction

function! s:allWords()
    return lib#list#list(reverse(getline(1, line('.'))) + getline(line('.') + 1, '$') + s:otherBufferLines()).flatMap("split(a:x, '[^a-zA-Z0-9-_$]')").get()
endfunction

function! s:otherBufferLines()
    return lib#list#range(1, bufnr('$')).filter("buflisted(a:x) && a:x != bufnr('%')").flatMap("getbufline(a:x, 1, '$')").get()
endfunction
