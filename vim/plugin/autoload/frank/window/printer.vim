function! frank#window#printer#entries(path)
	let head = frank#finder#head(a:path)
	let tree = frank#finder#tree(a:path)
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
