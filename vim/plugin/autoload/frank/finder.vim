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
	let pos = line('.') - 5
	let paths = frank#finder#find(pos)
	return split(paths, '\n')[0]
endfunction
