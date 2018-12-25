function! lib#buffer#update(putting, start, end)
    let lines = s:update(getline(1, '$'), a:putting, a:start, a:end)

    execute 'normal ggdG'
    call setline(1, lines)

    execute a:start
endfunction

function! s:update(lines, putting, start, end)
    let before = a:start == 1 ? [] : a:lines[: a:start - 2]
    let after = a:lines[a:end :]

    return before + a:putting + after
endfunction

"
" test
"

call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1', 'new-2'], 2, 3), ['foo', 'new-1', 'new-2', 'kaz'])
call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1', 'new-2'], 2, 4), ['foo', 'new-1', 'new-2'])
call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1', 'new-2'], 1, 3), ['new-1', 'new-2', 'kaz'])
call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1', 'new-2'], 1, 4), ['new-1', 'new-2'])
call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1'], 2, 3), ['foo', 'new-1', 'kaz'])
call lib#test#assert(s:update(['foo', 'bar', 'pon', 'kaz'], ['new-1'], 1, 4), ['new-1'])
call lib#test#assert(s:update(['foo', 'kaz'], ['new-1', 'new-2', 'new-3'], 2, 2), ['foo', 'new-1', 'new-2', 'new-3'])
