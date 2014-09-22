function! frank#window#printer#print(path)
	call frank#entry#create(a:path)
	call s:print(a:path)
endfunction

function! s:print(path)
	call frank#window#switcher#to1()
	call s:outputHead(a:path)
	call s:outputBody()
	execute 'normal 5gg0'
endfunction

function! s:outputHead(path)
	execute ':normal ggO'
	execute ':normal ' . len(a:path) . 'i-'
	call append(1, a:path)
	execute ':normal GO'
	execute ':normal ' . len(a:path) . 'i-'
endfunction

function! s:outputBody()
	for entry in g:entries
		call append('$', entry.output())
	endfor
endfunction

" terminalとか
"function! s:outputLines(lines)
"	call append(0, a:lines)
"	execute '$delete _'
"endfunction

"function! s:cursorAdjustWork3()
"	execute 'normal gg0'
"endfunction

"function! OutputLines(lines)
"	call s:outputLines(a:lines)
"	call s:cursorAdjustWork3()
"endfunction
