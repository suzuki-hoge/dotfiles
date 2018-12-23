echo lib#List([1, 2, 3, 4, 5])
   \.map('a:x + 1')
   \.filter('a:x % 2 == 0')
   \.flatMap('[a:x, a:x]')
   \.get() == [2, 2, 4, 4, 6, 6] ? 'ok' : 'ng'

echo lib#List('foo').map("a:x . '!'").map('toupper(a:x)').join('') == 'F!O!O!' ? 'ok' : 'ng'
