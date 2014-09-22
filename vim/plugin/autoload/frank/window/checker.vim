function! frank#window#checker#isFrank()
	return 1 == s:is1() + s:is2() + s:is3()
endfunction

function! s:is1()
	return !exists('g:frank1') ? 0 : bufnr('') == g:frank1
endfunction

function! s:is2()
	return !exists('g:frank2') ? 0 : bufnr('') == g:frank2
endfunction

function! s:is3()
	return !exists('g:frank3') ? 0 : bufnr('') == g:frank3
endfunction
