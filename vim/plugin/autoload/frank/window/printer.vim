function! frank#window#printer#entries()
	let head = frank#finder#head()
	let tree = frank#finder#tree()
	call frank#window#switcher#to(1)
	execute '1,$delete _'
	call append(0, split(head, '\n'))
	call append('$', split(tree, '\n'))
endfunction

function! frank#window#printer#to2(path)
	call frank#window#switcher#to(2)
	execute '1,$delete _'
	execute 'r ' . a:path
	execute '0delete _'
	let extension = fnamemodify(a:path, ':e')
	let &filetype = extension
endfunction

function! frank#window#printer#to3(lines)
	execute '1,$delete _'
	call append(0, a:lines)
	execute '$delete _'
	execute ':normal 1gg'
endfunction
