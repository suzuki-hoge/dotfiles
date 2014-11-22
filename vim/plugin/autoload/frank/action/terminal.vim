function! frank#action#terminal#open()
	let path = frank#finder#oneByPos()
	call s:open(path)
endfunction

function! s:open(path)
	if isdirectory(a:path)
		execute 'silent !open -a Terminal ' . a:path
	endif
endfunction

function! frank#action#terminal#ls()
	let path = frank#finder#oneByPos()
	call s:ls(path)
endfunction

function! s:ls(path)
	if isdirectory(a:path)
		call s:lsDir(a:path)
	else
		call s:lsFile(a:path)
	endif
endfunction

function! s:lsDir(path)
	let result  = system('ls -ld ' . a:path) . "\n"
	let result .= system('ls -lF ' . a:path . ' | tail +2')

	call frank#window#switcher#to(3)
	call frank#window#printer#to3(split(result, '\n'))
	call frank#window#switcher#to(1)
endfunction

function! s:lsFile(path)
	let result = system('ls -lF ' . a:path)

	call frank#window#switcher#to(3)
	call frank#window#printer#to3(split(result, '\n'))
	call frank#window#switcher#to(1)
endfunction
