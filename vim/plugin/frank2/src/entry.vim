let s:blacklist = ['.git', '.svn', '.vagrant', '.DS_Store', '*.pyc']

function! CreateEntries(path)
	let paths = s:finder(a:path)
	let g:entries = s:convert(a:path, paths)
endfunction

function! s:finder(path)
	let blacks = ''
	for black in s:blacklist
		let blacks .= ' -name "' . black . '" -prune -or'
	endfor

	echomsg 'find ' . a:path . blacks . ' -print'
	return system('find ' . a:path . blacks . ' -print')
endfunction

function! s:convert(basepath, paths)
	let s:baselen = len(a:basepath)

	let index = 4
	let entries = []
	for path in split(a:paths)
		let entry = {'path' : path, 'isDir' : isdirectory(path), 'fold' : 0, 'point' : 0, 'index' : index}

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

	return entries[1:]
endfunction