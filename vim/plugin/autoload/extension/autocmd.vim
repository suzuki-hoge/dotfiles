augroup extension
	autocmd!
	autocmd BufEnter *.vim call extension#vim#enter()
	autocmd BufLeave *.vim call extension#vim#leave()

	autocmd BufEnter *.py call extension#python#enter()
	autocmd BufLeave *.py call extension#python#leave()

	autocmd BufEnter *.hs call extension#haskell#enter()
	autocmd BufLeave *.hs call extension#haskell#leave()

	autocmd BufEnter *.rb call extension#ruby#enter()
	autocmd BufLeave *.rb call extension#ruby#leave()

	autocmd BufEnter *.md call extension#markdown#enter()
	autocmd BufLeave *.md call extension#markdown#leave()

	autocmd BufEnter *.html call extension#html#enter()
	autocmd BufLeave *.html call extension#html#leave()

	autocmd BufEnter *.js call extension#js#enter()
	autocmd BufLeave *.js call extension#js#leave()

	autocmd BufEnter *.zsh,*.bash,*.sh call extension#shell#enter()
	autocmd BufLeave *.zsh,*.bash,*.sh call extension#shell#leave()
augroup END
