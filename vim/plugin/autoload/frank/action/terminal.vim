function! frank#action#terminal#open()
	let entry = frank#action#base#getByCursor()
	if entry.isDir
		call s:open(entry)
	endif
endfunction

function! frank#action#terminal#ls()
	let entry = frank#action#base#getByCursor()
	call s:ls(entry)
endfunction

function! s:open(entry)
	execute 'silent !open -a Terminal ' . a:entry.path
endfunction

function! s:ls(entry)
	if a:entry.isDir
		call s:lsDir(a:entry)
	else
		call s:lsFile(a:entry)
	endif
endfunction

function! s:lsDir(entry)
	let result  = system('ls -ld ' . a:entry.path) . "\n"
	let result .= system('ls -lF ' . a:entry.path . ' | tail +2')

	call frank#window#switcher#to(3)
	call frank#window#printer#to3(split(result, '\n'))
	call frank#window#switcher#to(1)
endfunction

function! s:lsFile(entry)
	let result = system('ls -lF ' . a:entry.path)

	call frank#window#switcher#to(3)
	call frank#window#printer#to3(split(result, '\n'))
	call frank#window#switcher#to(1)
endfunction
