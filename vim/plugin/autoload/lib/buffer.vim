function! lib#buffer#clean()
	execute '1,$delete _'
endfunction

function! lib#buffer#print(data, finishpos)
	call lib#buffer#clean()
	call s:print(a:data)
	call lib#cursor#move(a:finishpos)
endfunction

function! lib#buffer#append(data, finishpos)
	call s:append(a:data)
	call lib#cursor#move(a:finishpos)
endfunction

function! s:print(data)
	call s:append(a:data)
	execute '1delete _'
endfunction

function! s:append(data)
	call append('$', a:data)
endfunction
