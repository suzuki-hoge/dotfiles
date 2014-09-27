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

function! frank#action#fold#openall()
	call s:updateall(0)
	execute 'normal zn'
endfunction

function! frank#action#fold#closeall()
	call s:updateall(1)
	execute 'normal zM'
endfunction

function! frank#action#fold#prev()
	call s:search('N')
endfunction

function! frank#action#fold#next()
	call s:search('n')
endfunction

function! s:update(entry, value)
	let a:entry.fold = a:value
	call frank#window#printer#update(a:entry)
endfunction

function! s:updateall(value)
	let pos = getpos('.')

	for entry in g:entries
		if entry.isDir
			call s:update(entry, a:value)
		endif
	endfor

	call setpos('.', pos)
	execute 'normal zz'
endfunction

function! s:search(command)
	let tmp = @/
	let @/ = '.*\/'
	execute 'normal ' a:command
	let @/ = tmp
endfunction
