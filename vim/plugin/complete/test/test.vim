"command! T wa | source $complete/test/test.vim | call RegexCompleteTest()

function! RegexCompleteTest()
	let words = ['a_b_c', 'a_b_c_', '_a_b_c', '_a_b_c_', 'b_c', 'a_b', 'a_c']
	let Words = ['a_b_c', 'a_B_C', 'a_B_c', 'A_B_C', 'a_b_B_c', 'a_B_b_c']

	let failures = 0

	let failures += s:test(words, '',      '',              words)
	let failures += s:test(words, 'a',     '^a',            ['a_b_c', 'a_b_c_', 'a_b', 'a_c'])
	let failures += s:test(words, 'c',     '^c',            [])
	let failures += s:test(words, '*c',    '.*c.*',         ['a_b_c', 'a_b_c_', '_a_b_c', '_a_b_c_', 'b_c', 'a_c'])
	let failures += s:test(words, 'c$',    '^c$',           [])
	let failures += s:test(words, '*c$',   '.*c$',          ['a_b_c', '_a_b_c', 'b_c', 'a_c'])
	let failures += s:test(words, 'abc',   '^a.*b.*c.*',    ['a_b_c', 'a_b_c_'])
	let failures += s:test(words, '*abc',  '.*a.*b.*c.*',   ['a_b_c', 'a_b_c_', '_a_b_c', '_a_b_c_'])
	let failures += s:test(words, 'abc$',  '^a.*b.*c$',     ['a_b_c'])
	let failures += s:test(words, '*abc$', '.*a.*b.*c$',    ['a_b_c', '_a_b_c'])
	let failures += s:test(Words, 'aBc',   '^a.*B.*c.*',    ['a_B_c', 'a_b_B_c', 'a_B_b_c'])
	let failures += s:test(Words, 'aBC',   '^a.*B.*C.*',    ['a_B_C'])
	let failures += s:test(Words, 'ABC',   '^A.*B.*C.*',    ['A_B_C'])
	let failures += s:test(Words, 'abBc',  '^a.*b.*B.*c.*', ['a_b_B_c'])

	if failures == 0
		echo 'All Green'
	else
		throw 'Test Failed'
	endif
endfunction

function! s:test(words, key, pattern, result)
	let failures = 0
	let failures += s:patternTest(a:key, a:pattern)
	let failures += s:completeTest(a:words, a:pattern, a:result)
	echo ' '
	return failures
endfunction

function! s:patternTest(key, pattern)
	let origin = a:key
	let expected = a:pattern
	let actual = complete#pattern#create(a:key)

	return s:assert(origin, expected, actual)
endfunction

function! s:completeTest(words, pattern, result)
	let origin = a:words
	let expected = a:result
	let actual = complete#filter#add(a:words, a:pattern)

	return s:assert(origin, expected, actual)
endfunction

function! s:assert(origin, expected, actual)
	if a:expected == a:actual
		echo 'OK | '
		echon a:origin
		echon ' -> '
		echon a:actual
		return 0
	else
		echo 'NG | expected : '
		echon a:expected
		echo '     actual   : '
		echon a:actual
		return 1
	endif
endfunction
