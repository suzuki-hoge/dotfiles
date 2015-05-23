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
let g:execute_mode = 0
let g:make_mode = 0
let g:test_mode = 0
let g:debug_mode = 0

nnoremap ÷ :call pete#main#commentize()<CR>
vnoremap ÷ :call pete#main#commentize()<CR>

nnoremap ? :call pete#main#decommentize()<CR>
vnoremap ? :call pete#main#decommentize()<CR>

nnoremap ¿ :call pete#main#switch()<CR>
vnoremap ¿ :call pete#main#switch()<CR>

command!          R        call pete#main#repl()
command!          E        call pete#main#edit()
command!          O        call pete#main#options()
command! -nargs=* W wall | call pete#main#execute(<f-args>)
command! -nargs=* M wall | call pete#main#make()
command! -nargs=* T wall | call pete#main#test(<f-args>)
command! -nargs=? D        call pete#main#debug(<f-args>)
command!          H        call pete#main#help()

command! RH call pete#main#replHelp()
command! EH call pete#main#editHelp()
command! OH call pete#main#optionsHelp()
command! CH call pete#main#commentHelp()
command! WH call pete#main#executeHelp(<f-args>)
command! MH call pete#main#makeHelp()
command! TH call pete#main#testHelp(<f-args>)
command! DH call pete#main#debugHelp(<f-args>)

command! -nargs=? WM call pete#mode#execute(<f-args>)
command! -nargs=? MM call pete#mode#make(<f-args>)
command! -nargs=? TM call pete#mode#test(<f-args>)
command! -nargs=? DM call pete#mode#debug(<f-args>)
