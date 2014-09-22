" <D-Space>とかも書いてるけど、
" 一つ消えたら連動するようなautocmd書けば良さそう
function! CloseAll()
"	call s:close(g:frank1)
"	call s:close(g:frank2)
"	call s:close(g:frank3)
endfunction

function! s:close(bufnum)
	if bufexists(a:bufnum)
		execute 'bdelete ' . a:bufnum
	endif
endfunction
