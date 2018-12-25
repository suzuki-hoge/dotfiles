function! lib#test#assert(act, exp)
    if a:act != a:exp | throw 'assertion failure: expect ' . s:toString(a:exp) . ', but got ' . s:toString(a:act) | endif
endfunction

function! s:toString(x)
    if   type(a:x) == type([]) | return join(a:x, ', ')
    else                       | return a:x            | endif
endfunction

call lib#test#assert(s:toString('foo'), 'foo')
call lib#test#assert(s:toString(5), '5')
call lib#test#assert(s:toString([1, 2]), '1, 2')
call lib#test#assert(s:toString(['foo', 'bar']), 'foo, bar')
