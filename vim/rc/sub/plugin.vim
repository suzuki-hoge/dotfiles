" vim:set ft=vim:

" complete
augroup regex_complete
	autocmd!
	autocmd BufEnter * :set completefunc=complete#main#func
augroup END

" table-converter
let g:table_converter_root_path = $HOME . '/Dropbox/Developments/dotfiles/apps/table-converter'
source ~/Dropbox/Developments/dotfiles/apps/table-converter/vim/commands.vim

command! IF  call interactive_filter#main#launch(1 == 0)
command! IFF call interactive_filter#main#launch(1 == 1)

command! -nargs=? O call interactive_filter#main#mkviml(<f-args>)
