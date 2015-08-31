augroup markdown
	autocmd!
	autocmd BufWritePost editing.md call markdown#main#update() | Reload
	autocmd BufEnter  editing.md set ft=markdown
augroup END
