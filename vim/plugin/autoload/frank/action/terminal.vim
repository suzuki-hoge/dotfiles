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
	call frank#window#switcher#to(3)

	let dir = system('ls -ld ' . a:path) . "\n"
	let files = system('ls -lF ' . a:path . ' | tail +2')[:-2]

	call lib#buffer#print(dir, 0)
	call lib#buffer#append(files, 0)

	call frank#window#switcher#to(1)
endfunction

function! s:lsFile(path)
	call frank#window#switcher#to(3)

	let file = system('ls -lF ' . a:path)
	call lib#buffer#print(file, 0)

	call frank#window#switcher#to(1)
endfunction
