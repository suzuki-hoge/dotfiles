let s:finder = 'python -B ' .  $frank . '/api/Finder.py'

function! frank#finder#head(path)
	let recreate = s:isRecreate()
	return s:strong(system(s:finder . recreate . ' -h ' . a:path)[:-2])
endfunction

function! frank#finder#tree(path)
	let recreate = s:isRecreate()
	return system(s:finder . recreate . ' -t ' . a:path)[:-2]
endfunction

function! frank#finder#find(ids)
	let recreate = s:isRecreate()
	let path = s:rootOrCurrent()
	return system(s:finder . recreate . ' -f ' . path . ' ' . a:ids)[:-2]
endfunction

function! frank#finder#oneByPos()
	let ids = line('.') - 5
	let paths = frank#finder#find(ids)
	return split(paths, '\n')[0]
endfunction

function! frank#finder#oneByRange(first, last)
	let range = range(a:first - 5, a:last - 5)
	let ids = join(range, ' ')
	let paths = frank#finder#find(ids)
	return split(paths, '\n')
endfunction

function! s:strong(head)
	if frank#checker#isRootMode()
		return substitute(a:head, '-', '=', 'g')
	else
		return a:head
	endif
endfunction

function! s:isRecreate()
	if frank#checker#isRootMode()
		return ''
	else
		return ' -r '
	endif
endfunction

function! s:rootOrCurrent()
	if frank#checker#isRootMode()
		return g:project_root
	else
		return g:current_path
	endif
endfunction
