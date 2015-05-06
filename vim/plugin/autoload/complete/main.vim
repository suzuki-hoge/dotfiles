function! complete#main#func(findstart, base)
    if a:findstart
		return complete#position#findWordHead()
    endif

    let words = complete#words#findAll()
	let pattern = complete#pattern#create(a:base)

	call complete#filter#add(words, pattern)
endfunction
