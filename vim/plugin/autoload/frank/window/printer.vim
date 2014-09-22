function! frank#window#printer#to1(path)
	call frank#entry#create(a:path)
	call s:print(a:path)
endfunction

function! s:print(path)
	call frank#window#switcher#to(1)
	execute '1,$delete _'
	call s:outputHead(a:path)
	call s:outputBody()
	execute 'normal 5gg0'
endfunction

function! s:outputHead(path)
	execute ':normal ggO'
	execute ':normal ' . len(a:path) . 'i-'
	call append(1, a:path)
	execute ':normal GO'
	execute ':normal ' . len(a:path) . 'i-'
endfunction

function! s:outputBody()
	for entry in g:entries
		call append('$', entry.output())
	endfor
endfunction

function! frank#window#printer#update(entry)
	execute a:entry.index . 'delete'
	call append(a:entry.index - 1, a:entry.output())
	execute 'normal ' . a:entry.index . 'gg0'
endfunction

function! frank#window#printer#to2(path)
	call frank#window#switcher#to(2)
	execute 'r ' . a:path
	execute '0delete _'
	let extension = fnamemodify(a:path, ':e')
	let &filetype = extension
endfunction

function! frank#window#printer#to3(lines)
	execute '1,$delete _'
	call s:lines(a:lines)
	execute 'normal gg0'
endfunction

function! s:lines(lines)
	call append(0, a:lines)
	execute '$delete _'
endfunction
