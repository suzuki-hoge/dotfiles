function! frank#window#switcher#to1()
	call s:switch(g:frank1)
endfunction

function! frank#window#switcher#to2()
	call s:switch(g:frank2)
endfunction

function! frank#window#switcher#to3()
	call s:switch(g:frank3)
endfunction

function! s:switch(bufnum)
	let l:winnum = bufwinnr(a:bufnum)
	execute winnum . 'wincmd w'
endfunction
