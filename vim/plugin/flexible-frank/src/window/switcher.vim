function! WindowSwitch1()
	call s:switch(g:frank1)
endfunction

function! WindowSwitch2()
	call s:switch(g:frank2)
endfunction

function! WindowSwitch3()
	call s:switch(g:frank3)
endfunction

function! s:switch(bufnum)
	let l:winnum = bufwinnr(a:bufnum)
	execute winnum . 'wincmd w'
endfunction
