function! frank#action#read#exec()
	if !frank#checker#isFullMode()
		echo 'enable only at full mode.'
		return
	endif

	let path = frank#finder#oneByPos()
	call s:read(path)
endfunction

function! s:read(path)
	if !isdirectory(a:path)
		call frank#window#switcher#to(2)

		let lines = readfile(a:path)
		call lib#buffer#print(lines, 0)

		let extension = lib#path#extension(a:path)
		let &filetype = extension

		call frank#window#switcher#to(1)
	endif
endfunction
