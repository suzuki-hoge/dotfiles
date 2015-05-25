function! pete#help#execute(command, text)
	try
		echo pete#modules#callapi(a:command, a:text)
	catch /Invalid/
		echo 'nothing to show'
	endtry
endfunction


function! pete#help#comment()
	try
		echo pete#modules#callapi('CommentHelp ', 'pete')
	catch /Invalid/
		echo 'nothing to show'
	endtry
endfunction
