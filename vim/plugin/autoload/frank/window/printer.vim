function! frank#window#printer#entries(path)
	let g:current_path = a:path

	let head = frank#finder#head(a:path) . "\n\n"
	let tree = frank#finder#tree(a:path)
	call frank#window#switcher#to(1)

	call lib#buffer#print(head, 0)
	call lib#buffer#append(tree, 0)
endfunction
