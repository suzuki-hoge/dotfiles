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
	let slashes = len(substitute(a:path, '[^/]', '', 'g'))
	call append(1, a:path . repeat('}', slashes))
	execute ':normal GO'
	execute ':normal ' . len(a:path) . 'i-'
endfunction

function! s:outputBody()
	for i in range(len(g:entries))
		call append('$', g:entries[i].output() . s:mark(i))
	endfor
endfunction

" entry側に持って行くのはありかも
function! s:mark(i)
	let nowdepth  = g:entries[a:i].depth

	if a:i == len(g:entries) - 1
		if nowdepth == 0
			return ''
		else
			return '}'
		endif
	else
		let nextdepth = g:entries[a:i + 1].depth
	endif

"	if nowdepth < nextdepth
"		return '{'
	if nowdepth > nextdepth
		let result = ''
		for i in range(nowdepth - nextdepth)
			let result .= '}'
		endfor
		return result
	else
		return ''
endfunction

function! frank#window#printer#update(entry)
	let point = a:entry.point ? '* ' : '  '
	let fold = a:entry.isDir ? (a:entry.fold ? '- ' : '+ ') : '  '
	execute 'normal ' . a:entry.index . 'gg0'
	execute 'normal R' . fold . point

	if a:entry.fold
		execute 'normal zc'
	endif

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
