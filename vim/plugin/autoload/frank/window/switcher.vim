function! frank#window#switcher#switch(n)
	let n = bufnr('frank-' . a:n)
	execute n . 'wincmd w'
endfunction
