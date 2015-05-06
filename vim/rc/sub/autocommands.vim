" vim:set ft=vim:

augroup subrc
	autocmd!
	autocmd VimEnter * set nowrap
	autocmd VimEnter * set nrformats=
	autocmd FileType py setlocal filetype=python
augroup END
