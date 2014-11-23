function! frank#action#base#keymap()
	nnoremap <buffer> e  :call frank#action#edit#normal()<CR>
	vnoremap <buffer> e  :call frank#action#edit#visual()<CR>

"	nnoremap <buffer> p  :call frank#action#point#normal(1)<CR>
"	vnoremap <buffer> p  :call frank#action#point#visual(1)<CR>

"	nnoremap <buffer> P  :call frank#action#point#normal(0)<CR>
"	vnoremap <buffer> P  :call frank#action#point#visual(0)<CR>

	nnoremap <buffer> to :call frank#action#terminal#open()<CR>
	nnoremap <buffer> tl :call frank#action#terminal#ls()<CR>

	nnoremap <buffer> o  :call frank#action#open#open()<CR>
	nnoremap <buffer> a  :call frank#action#open#app()<CR>
	nnoremap <buffer> q  :call frank#action#open#qlmanage()<CR>

	nnoremap <buffer> rd :call frank#action#read#exec()<CR>

	nnoremap <buffer> h  :call frank#action#directory#up()<CR>
	nnoremap <buffer> l  :call frank#action#directory#down()<CR>
	nnoremap <buffer> -  :call frank#action#directory#prev()<CR>

	nnoremap <buffer> H :call frank#action#fold#close()<CR>
	nnoremap <buffer> L :call frank#action#fold#open()<CR>
	nnoremap <buffer> fH :call frank#action#fold#closeall()<CR>
	nnoremap <buffer> fL :call frank#action#fold#openall()<CR>
	nnoremap <buffer> fk :call frank#action#fold#prev()<CR>
	nnoremap <buffer> fj :call frank#action#fold#next()<CR>
endfunction

"function! frank#action#base#getByCursor()
"	return g:entries[getpos('.')[1] - 1]
"endfunction

"function! frank#action#base#getByRange(first, last)
"	return g:entries[a:first - 1 : a:last - 1]
"endfunction

"function! frank#action#base#getByPoint()
"	let result = []
"	for entry in g:entries
"		if entry.point
"			let result = result + [entry]
"		endif
"	endfor
"	return result
"endfunction
