function! frank#window#switcher#switch(n)
	let bufnum = bufnr('frank-' . a:n)
	let winnum = bufwinnr(bufnum)
	execute winnum . 'wincmd w'
endfunction
