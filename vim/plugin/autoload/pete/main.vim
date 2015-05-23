function! pete#main#commentize() range
	for n in range(a:firstline, a:lastline)
		" todo
		call setline(n, pete#modules#callapi('Commentize ', getline(n)))
	endfor
endfunction


function! pete#main#decommentize() range
	for n in range(a:firstline, a:lastline)
		call setline(n, pete#modules#callapi('Decommentize ', getline(n)))
	endfor
endfunction


function! pete#main#switch() range
	for n in range(a:firstline, a:lastline)
		call setline(n, pete#modules#callapi('Switch ', getline(n)))
	endfor
endfunction


function! pete#main#repl()
	execute pete#modules#callapi('Repl ', '-')
endfunction


function! pete#main#edit()
	execute pete#modules#callapi('Edit ', 'a')
endfunction


function! pete#main#options()
	execute pete#modules#callapi('Options ', '-')
endfunction


function! pete#main#execute(...)
	let command = pete#modules#callapi('Execute ', '-')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#make(...)
	let command = pete#modules#callapi('Make ', '-')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#test(...)
	let command = pete#modules#callapi('Test ', '-')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#debug(...)
	let lines = pete#modules#callapi('Debug ', get(a:, 1, s:getWord()))
	execute 'normal o'
	execute 'normal o' . lines
	execute 'normal o'
endfunction


function! pete#main#help()
	echo pete#modules#callapi('Help ', 'pete')
endfunction


function! s:getWord()
	return expand('<cword>')
endfunction
