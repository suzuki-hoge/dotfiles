function! IsFrank()
	return 1 == s:isWork1() + s:isWork2() + s:isWork3()
endfunction

function! s:isWork1()
	return !exists('g:frank1') ? 0 : bufnr('') == g:frank1
endfunction

function! s:isWork2()
	return !exists('g:frank2') ? 0 : bufnr('') == g:frank2
endfunction

function! s:isWork3()
	return !exists('g:frank3') ? 0 : bufnr('') == g:frank3
endfunction
