function! lib#string#noQuoting(lines, quoteStart, quoteEnd)
    return s:loop(a:lines, a:quoteStart, a:quoteEnd, [])
endfunction

function! lib#string#emptyQuoting(lines, quoteStart, quoteEnd)
    return s:loop(a:lines, a:quoteStart, a:quoteEnd, [''])
endfunction

function! s:loop(lines, quoteStart, quoteEnd, after)
    let quoting = 0
    let result = []

    for line in a:lines
        if line =~? a:quoteStart && quoting == 0
            let quoting = 1
            let result = result + a:after

        elseif line =~? a:quoteEnd && quoting == 1
            let quoting = 0
            let result = result + a:after

        elseif quoting == 1
            let result = result + a:after

        elseif quoting == 0
            let result = result + [line] | endif | endfor

    return result
endfunction

function! lib#string#padl(s, n, fill)
    return s:pad(a:s, a:n, a:fill) . a:s
endfunction

function! lib#string#padr(s, n, fill)
    return a:s . s:pad(a:s, a:n, a:fill)
endfunction

function! s:pad(s, n, fill)
    return repeat(a:fill, a:n - len(a:s))
endfunction

function! lib#string#replace(s, ...)
    let result = a:s
    for [src, dst] in a:000
        let result = substitute(result, src, dst, 'g')
    endfor
    return result
endfunction

"
" test
"

call lib#test#assert(s:loop(['foo', 'bar', 'pon'], '^```', '```', []), ['foo', 'bar', 'pon'])
call lib#test#assert(s:loop(['foo', '```python', 'print 5', '```', 'bar', '```python', 'print 5', '```', 'pon'], '^```', '```', []), ['foo', 'bar', 'pon'])
call lib#test#assert(s:loop(['foo', '```python', 'print 5', '```', 'bar', '```python', 'print 5', '```', 'pon'], '^```', '```', ['']), ['foo', '', '', '', 'bar', '', '', '', 'pon'])

call lib#test#assert(lib#string#padl('foo', 5, '-'), '--foo')
call lib#test#assert(lib#string#padl('foo', 2, '-'), 'foo')
call lib#test#assert(lib#string#padl(1, 3, '0'), '001')

call lib#test#assert(lib#string#padr('foo', 5, '-'), 'foo--')
call lib#test#assert(lib#string#padr('foo', 2, '-'), 'foo')

call lib#test#assert(lib#string#padr('foo', 2, '-'), 'foo')

call lib#test#assert(lib#string#replace('12345', ['2', 'B'], ['4', 'D']), '1B3D5')
call lib#test#assert(lib#string#replace("echo 'foo'", ["'", "\'"]), "echo \'foo\'")
