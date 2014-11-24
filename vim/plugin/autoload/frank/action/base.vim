function! frank#action#base#keymap()
	nnoremap <buffer> e  :call frank#action#edit#normal(0)<CR>
	vnoremap <buffer> e  :call frank#action#edit#visual(0)<CR>

	nnoremap <buffer> E  :call frank#action#edit#normal(1)<CR>
	vnoremap <buffer> E  :call frank#action#edit#visual(1)<CR>

	nnoremap <buffer> to :call frank#action#terminal#open()<CR>
	nnoremap <buffer> tl :call frank#action#terminal#ls()<CR>

	nnoremap <buffer> o  :call frank#action#open#open()<CR>
	nnoremap <buffer> a  :call frank#action#open#app()<CR>
	nnoremap <buffer> q  :call frank#action#open#qlmanage()<CR>

	nnoremap <buffer> rd :call frank#action#read#exec()<CR>

	nnoremap <buffer> h  :call frank#action#directory#up()<CR>
	nnoremap <buffer> l  :call frank#action#directory#go()<CR>
	nnoremap <buffer> -  :call frank#action#directory#back()<CR>

"	nnoremap <buffer> H :call frank#action#fold#close()<CR>
"	nnoremap <buffer> L :call frank#action#fold#open()<CR>
"	nnoremap <buffer> fH :call frank#action#fold#closeall()<CR>
"	nnoremap <buffer> fL :call frank#action#fold#openall()<CR>
"	nnoremap <buffer> fk :call frank#action#fold#prev()<CR>
"	nnoremap <buffer> fj :call frank#action#fold#next()<CR>
endfunction
