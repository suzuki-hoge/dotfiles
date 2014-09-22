function! frank#action#directory#up()
	let upper = fnamemodify(frank#dirstack#last(), ':h')
	let depth = len(substitute(upper, '[^/]', '', 'g'))
	if depth < 3
		echo 'too many files...'
	else
		call s:cd(upper)
		call frank#dirstack#push(upper)
	endif
endfunction

function! frank#action#directory#down()
	let entry = frank#action#base#getByCursor()
	if entry.isDir
		call s:cd(entry.path)
		call frank#dirstack#push(entry.path)
	endif
endfunction

function! frank#action#directory#prev()
	let prev = frank#dirstack#pop()
	call s:cd(prev)
endfunction

function! s:cd(path)
	call frank#window#printer#to1(a:path)
endfunction
