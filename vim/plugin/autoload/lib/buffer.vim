function! lib#buffer#clean()
	execute '1,$delete _'
endfunction

function! lib#buffer#print(data, finishpos)
	call lib#buffer#clean()
	call s:print(a:data)
	call lib#cursor#move(a:finishpos)
endfunction

function! lib#buffer#append(data, finishpos)
	let data = s:split(a:data)
	call s:append(data)
	call lib#cursor#move(a:finishpos)
endfunction

function! s:print(data)
	let data = s:split(a:data)
	call s:append(data)
	execute '1delete _'
endfunction

function! s:append(data)
	call append('$', a:data)
endfunction

function! s:split(data)
	if type(a:data) == type([])
		return a:data
	elseif type(a:data) == type('')
		return split(a:data, '\n')
	endif
endfunction
