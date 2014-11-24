function! frank#action#base#keymap()
	nnoremap <buffer> e    :call frank#action#edit#normal(0)<CR>
	vnoremap <buffer> e    :call frank#action#edit#visual(0)<CR>

	nnoremap <buffer> E    :call frank#action#edit#normal(1)<CR>
	vnoremap <buffer> E    :call frank#action#edit#visual(1)<CR>

	nnoremap <buffer> to   :call frank#action#terminal#open()<CR>
	nnoremap <buffer> tl   :call frank#action#terminal#ls()<CR>

	nnoremap <buffer> o    :call frank#action#open#open()<CR>
	nnoremap <buffer> a    :call frank#action#open#app()<CR>
	nnoremap <buffer> q    :call frank#action#open#qlmanage()<CR>

	nnoremap <buffer> rd   :call frank#action#read#exec()<CR>

	nnoremap <buffer> ..   :call frank#action#directory#up()<CR>
	nnoremap <buffer> <CR> :call frank#action#directory#go()<CR>
	nnoremap <buffer> -    :call frank#action#directory#back()<CR>

	nnoremap <buffer> h    zc
	nnoremap <buffer> l    zo
	nnoremap <buffer> H    zM
	nnoremap <buffer> L    zn
	nnoremap <buffer> fs   :let @/ = '^[^\/][^\{\}]*\/'<CR>
	nnoremap <buffer> fu   [z
endfunction
