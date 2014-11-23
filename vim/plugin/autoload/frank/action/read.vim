function! frank#action#read#exec()
	let path = frank#finder#oneByPos()
	call s:read(path)
endfunction

function! s:read(path)
	if !isdirectory(a:path)
		call frank#window#printer#to2(a:path)
		call frank#window#switcher#to(1)
	endif
endfunction
