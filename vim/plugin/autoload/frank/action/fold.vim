function! frank#action#fold#open()
	call s:update(0)
	execute 'normal zo'
endfunction

function! frank#action#fold#close()
	call s:update(1)
	execute 'normal zc'
endfunction

function! frank#action#fold#prev()
	call s:search('N')
endfunction

function! frank#action#fold#next()
	call s:search('n')
endfunction

function! s:update(value)
	let entry = frank#action#base#getByCursor()
	let entry.fold = a:value
	call frank#window#printer#update(entry)
endfunction

function! s:search(command)
	let tmp = @/
	let @/ = '.*\/'
	execute 'normal ' a:command
	let @/ = tmp
endfunction
