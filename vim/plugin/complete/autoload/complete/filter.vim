function! complete#filter#add(words, pattern)
	let result = []

	if s:hasUppercase(a:pattern)
		for word in a:words
			if word =~# a:pattern
				call complete_add({'word' : word})
				let result = add(result, word)
			endif
		endfor

	else
		for word in a:words
			if word =~? a:pattern
				call complete_add({'word' : word})
				let result = add(result, word)
			endif
		endfor
	endif

	return result
endfunction

function! s:hasUppercase(pattern)
	return tolower(a:pattern) !=# a:pattern
endfunction
