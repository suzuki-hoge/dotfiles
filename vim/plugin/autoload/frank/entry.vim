let s:blacklist = ['.git', '.svn', '.vagrant', '.DS_Store', '*.pyc']

function! frank#entry#create(path)
	let paths = s:finder(a:path)
	let entries = s:header(a:path)
	let g:entries = s:body(entries, a:path, paths)
endfunction

function! s:finder(path)
	let blacks = ''
	for black in s:blacklist
		let blacks .= ' -name "' . black . '" -prune -or'
	endfor

	return system('find ' . a:path . blacks . ' -print')[1:]
endfunction

function! s:header(path)
	let upperline = {'path' : a:path, 'index' : 1, 'operatable' : 0}
	function! upperline.output()
		return repeat('-', len(self.path))
	endfunction

	let path = {'path' : a:path, 'index' : 2, 'operatable' : 0}
	function! path.output()
		return self.path
	endfunction

	let downerline = {'path' : a:path, 'index' : 3, 'operatable' : 0}
	function! downerline.output()
		return repeat('-', len(self.path))
	endfunction

	return [upperline, path, downerline]
endfunction

function! s:body(entries, basepath, paths)
	let s:baselen = len(a:basepath)

	let index = 5
	let entries = a:entries
	for path in split(a:paths)
		let depth = len(substitute(path[s:baselen + 1:], '[^/]', '', 'g'))
		let entry = {'path' : path, 'isDir' : isdirectory(path), 'depth' : depth, 'fold' : 0, 'point' : 0, 'index' : index, 'operatable' : 1}

		function! entry.output()
			let fold = self.isDir ? (self.fold ? '- ' : '+ ') : '  '
			let point = self.point ? '* ' : '  '
			let name = substitute(self.path[s:baselen + 1:], '[^/]*/', '    ', 'g')
			let slash = self.isDir ? '/' : ''

			return fold . point . name . slash
		endfunction

		let entries = entries + [entry]
		let index += 1
	endfor

	return entries
endfunction
