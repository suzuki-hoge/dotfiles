function! CreatePattern2(base)
	let result = ''

	for i in range(len(a:base))
		if IsFirstCharacter(i)
			let result .= FirstCharacter(i, a:base)

		elseif IsLastCharacter(i, a:base)
			let result .= LastCharacter(i, a:base)

		else
			let result .= MiddleCharacter(i, a:base)
		endif
	endfor

	return result
endfunction

function! IsFirstCharacter(i)
	return a:i == 0
endfunction

function! IsLastCharacter(i, string)
	return a:i == len(a:string) - 1
endfunction

" *abc -> .*
" abc -> ^a.*
function! FirstCharacter(i, string)
	if a:string[a:i] == '*'
		return ''
	else
		return '^' . a:string[a:i]
	endif
endfunction

" abc$ -> $
" abc -> c.*
function! LastCharacter(i, string)
	if a:string[a:i] == '$'
		return '$'
	else
		return '.*' . a:string[a:i] . '.*'
	endif
endfunction

" abc -> b.*
function! MiddleCharacter(i, string)
	return '.*' . a:string[a:i]
endfunction

function! AddComplete(words, pattern)
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
