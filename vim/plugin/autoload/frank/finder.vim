let s:finder = 'python -B ' .  $frank . '/api/Finder.py'

function! frank#finder#head()
	return system(s:finder . ' -h ' . g:project_root_path)
endfunction

function! frank#finder#tree()
	return system(s:finder . ' -t ' . g:project_root_path)
endfunction

function! frank#finder#find(ids)
	return system(s:finder . ' -f ' . g:project_root_path . ' ' . a:ids)
endfunction

function! frank#finder#bypos()
	let pos = line('.') - 5
	return frank#finder#find(pos)
endfunction
