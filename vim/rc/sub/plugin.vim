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

let g:execute_path = '%'
let g:make_path = '%'
let g:test_path = '%'

nnoremap ÷ :call pete#main#callComment('Commentize ')<CR>
vnoremap ÷ :call pete#main#callComment('Commentize ')<CR>

nnoremap ? :call pete#main#callComment('Decommentize ')<CR>
vnoremap ? :call pete#main#callComment('Decommentize ')<CR>

nnoremap ¿ :call pete#main#callComment('Switch ')<CR>
vnoremap ¿ :call pete#main#callComment('Switch ')<CR>

command!          R        call pete#main#call('Repl ', '-')
command!          E        call pete#main#call('Edit ', 'a')
command!          O        call pete#main#call('Options ', '-')
command! -nargs=* W wall | call pete#main#execute(<f-args>)
command! -nargs=* M wall | call pete#main#make(<f-args>)
command! -nargs=* T wall | call pete#main#test(<f-args>)
command! -nargs=? D        call pete#main#debug(<f-args>)
command!          H        call pete#main#callHelp('Help ', 'pete')

command! RH call pete#main#callHelp('ReplHelp ', '-')
command! EH call pete#main#callHelp('EditHelp ', 'a')
command! OH call pete#main#callHelp('OptionsHelp ', '-')
command! CH call pete#main#callCommentHelp()
command! WH call pete#main#callHelp('ExecuteHelp ', '-')
command! MH call pete#main#callHelp('MakeHelp ', '-')
command! TH call pete#main#callHelp('TestHelp ', '-')
command! DH call pete#main#callHelp('DebugHelp ', '-')

command! -nargs=? WM call pete#mode#execute(<f-args>)
command! -nargs=? MM call pete#mode#make(<f-args>)
command! -nargs=? TM call pete#mode#test(<f-args>)

command! -nargs=? -complete=file WP call pete#path#execute(<f-args>)
command! -nargs=? -complete=file MP call pete#path#make(<f-args>)
command! -nargs=? -complete=file TP call pete#path#test(<f-args>)

command! PETE call pete#modules#editPete()
