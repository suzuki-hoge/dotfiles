function! pete#main#call(command, text)
	try
		execute pete#modules#callapi(a:command, a:text)
	catch /Invalid/
		echo 'nothing to do'
	endtry
endfunction


function! pete#main#callHelp(command, text)
	try
		echo pete#modules#callapi(a:command, a:text)
	catch /Invalid/
		echo 'nothing to show'
	endtry
endfunction


function! pete#main#callComment(command) range
	try
		for n in range(a:firstline, a:lastline)
			call setline(n, pete#modules#callapi(a:command, pete#modules#escape(getline(n))))
		endfor
	catch /Invalid/
		echo 'nothing to do'
	endtry
endfunction


function! pete#main#callCommentHelp()
	try
		echo pete#modules#callapi('CommentHelp ', 'pete')
	catch /Invalid/
		echo 'nothing to show'
	endtry
endfunction


function! pete#main#callPath(command, path, ...)
	try
		let command = pete#modules#callapi(a:command, a:path)
		execute command . pete#modules#getargs(a:000)
	catch /Invalid/
		echo 'nothing to to'
	endtry
endfunction


function! pete#main#debug(...)
	let lines = pete#modules#callapi('Debug ', get(a:, 1, expand('<cword>')))
	execute 'normal o'
	execute 'normal o' . lines
	execute 'normal o'
endfunction
