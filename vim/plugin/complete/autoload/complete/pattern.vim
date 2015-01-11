function! complete#pattern#create(base)
	let result = ''

	for i in range(len(a:base))
		if s:isFirst(i)
			let result .= s:first(i, a:base)

		elseif s:isLast(i, a:base)
			let result .= s:last(i, a:base)

		else
			let result .= s:middle(i, a:base)
		endif
	endfor

	return result
endfunction

function! s:isFirst(i)
	return a:i == 0
endfunction

function! s:isLast(i, string)
	return a:i == len(a:string) - 1
endfunction

" 0, *abc -> ''
" 0, abc  -> ^a
function! s:first(i, string)
	if a:string[a:i] == '*'
		return ''
	else
		return '^' . a:string[a:i]
	endif
endfunction

" 3, abc$ -> $
" 2, abc -> .*c.*
function! s:last(i, string)
	if a:string[a:i] == '$'
		return '$'
	else
		return '.*' . a:string[a:i] . '.*'
	endif
endfunction

" 1, abc -> .*b
function! s:middle(i, string)
	return '.*' . a:string[a:i]
endfunction
