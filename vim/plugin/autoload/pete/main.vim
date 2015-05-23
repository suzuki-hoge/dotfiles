function! pete#main#repl()
	execute pete#modules#callapi('Repl ', '-')
endfunction


function! pete#main#replHelp()
	echo pete#modules#callapi('ReplHelp ', '-')
endfunction


function! pete#main#edit()
	execute pete#modules#callapi('Edit ', 'a')
endfunction


function! pete#main#editHelp()
	echo pete#modules#callapi('EditHelp ', 'a')
endfunction


function! pete#main#options()
	execute pete#modules#callapi('Options ', '-')
endfunction


function! pete#main#optionsHelp()
	echo pete#modules#callapi('OptionsHelp ', '-')
endfunction


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


function! pete#main#commentHelp()
	echo pete#modules#callapi('CommentHelp ', 'pete')
endfunction


function! pete#main#execute(...)
	let command = pete#modules#callapi('Execute ', '-')
	" % or args
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#executeHelp()
	echo pete#modules#callapi('ExecuteHelp ', '-')
endfunction


function! pete#main#make(...)
	let command = pete#modules#callapi('Make ', '-')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#makeHelp()
	echo pete#modules#callapi('MakeHelp ', '-')
endfunction


function! pete#main#test(...)
	let command = pete#modules#callapi('Test ', '-')
	execute command . '%' . pete#modules#getargs(a:000)
endfunction


function! pete#main#testHelp()
	echo pete#modules#callapi('TestHelp ', '-')
endfunction


function! pete#main#debug(...)
	let lines = pete#modules#callapi('Debug ', get(a:, 1, expand('<cword>')))
	execute 'normal o'
	execute 'normal o' . lines
	execute 'normal o'
endfunction


function! pete#main#debugHelp()
	echo pete#modules#callapi('DebugHelp ', '-')
endfunction


function! pete#main#help()
	echo pete#modules#callapi('Help ', 'pete')
endfunction
