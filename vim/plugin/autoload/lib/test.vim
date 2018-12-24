echo lib#list#list([1, 2, 3, 4, 5])
   \.map('a:x + 1')
   \.filter('a:x % 2 == 0')
   \.flatMap('[a:x, a:x]')
   \.get() == [2, 2, 4, 4, 6, 6] ? 'ok' : 'ng'

echo lib#list#list('foo').map("a:x . '!'").map('toupper(a:x)').join('') == 'F!O!O!' ? 'ok' : 'ng'

function! s:foo(x)
    return a:x % 2 == 0 ? 'even' : 'odd'
endfunction

echo lib#list#range(1, 3).mapF(function('s:foo')).unique() == ['even', 'odd'] ? 'ok' : 'ng'
