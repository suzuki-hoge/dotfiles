" vim:set ft=vim:

" todo
source $plugin/autoload/todo/configure.vim

" frank
command! -nargs=? -complete=dir F           call frank#main#open(<f-args>)
command!                        FL          call frank#launcher#selector()
command!                        FP          call frank#launcher#current_project()
command!                        FLConfigure call frank#launcher#configure()

" complete
augroup regex_complete
	autocmd!
	autocmd BufEnter * :set completefunc=complete#main#func
augroup END

" pete
command! H call pete#main#help()
command! -nargs=* W wall | call pete#main#execute(<f-args>)
command! -nargs=* T wall | call pete#main#test(<f-args>)
command! E call pete#main#edit()
command! R call pete#main#repl()
command! -nargs=* M wall | call pete#main#make()
command! O call pete#main#options()
command! -nargs=? D call pete#main#debug(<f-args>)

nnoremap ÷ :call pete#main#commentize()<CR>
vnoremap ÷ :call pete#main#commentize()<CR>

nnoremap ? :call pete#main#decommentize()<CR>
vnoremap ? :call pete#main#decommentize()<CR>

nnoremap ¿ :call pete#main#switch()<CR>
vnoremap ¿ :call pete#main#switch()<CR>
