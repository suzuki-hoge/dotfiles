let s:finder = 'python -B ' .  $frank . '/api/Finder.py'

function! frank#finder#head()
	return system(s:finder . ' -h ' . g:project_root_path)[:-2]
endfunction

function! frank#finder#tree()
	return system(s:finder . ' -t ' . g:project_root_path)[:-2]
endfunction

function! frank#finder#find(ids)
	return system(s:finder . ' -f ' . g:project_root_path . ' ' . a:ids)[:-2]
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
