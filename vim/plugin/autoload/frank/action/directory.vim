function! frank#action#directory#up()
	try
		call frank#checker#checkNotRootMode()

		let upper = lib#path#head(frank#dirstack#last())

		call frank#checker#checkTooShallowDepth(upper)

		call s:cd(upper)
		call frank#dirstack#push(upper)

	catch /RootMode/
		echo 'disable only at root mode.'

	catch /TooShallowDepth/
		echo 'too shallow path.'
	endtry
endfunction

function! frank#action#directory#go()
	try
		let path = frank#finder#oneByPos()

		if isdirectory(path)
			call s:cd(path)
			call frank#dirstack#push(path)
		endif

	catch /RootMode/
		echo 'disable only at root mode.'
	endtry
endfunction

function! frank#action#directory#back()
	try
		let prev = frank#dirstack#pop()
		call s:cd(prev)

	catch /RootMode/
		echo 'disable only at root mode.'
	endtry
endfunction

function! s:cd(path)
	call frank#window#printer#entries(a:path)
endfunction
