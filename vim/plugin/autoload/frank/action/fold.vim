function! frank#action#fold#open()
	let entry = frank#action#base#getByCursor()
	call s:update(entry, 0)
	execute 'normal zo'
endfunction

function! frank#action#fold#close()
	let entry = frank#action#base#getByCursor()
	call s:update(entry, 1)
	execute 'normal zc'
endfunction

function! s:update(entry, value)
	let a:entry.fold = a:value
	call frank#window#printer#update(a:entry)
endfunction
