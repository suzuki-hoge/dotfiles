let s:markdown_workspace = $markdown . '/workspace/'

let s:first    = s:markdown_workspace . 'first-half.template'
let s:second   = s:markdown_workspace . 'second-half.template'
let s:editing  = s:markdown_workspace . 'editing.md'
let s:html     = s:markdown_workspace . 'markdown.html'


function! markdown#window#open()
	execute 'tabedit ' . s:editing
	call system('open /Applications/Google\ Chrome.app ' . s:html)
endfunction


function! markdown#window#update()
	call system('cat ' . s:first . ' ' . s:editing . ' ' . s:second . ' > ' . s:html)
endfunction

" -no-vim
" autocmd
" markdown.syntax
