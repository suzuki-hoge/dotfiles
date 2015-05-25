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

nnoremap ÷ :call pete#main#comment('Commentize')<CR>
vnoremap ÷ :call pete#main#comment('Commentize')<CR>

nnoremap ? :call pete#main#comment('Decommentize')<CR>
vnoremap ? :call pete#main#comment('Decommentize')<CR>

nnoremap ¿ :call pete#main#comment('Switch')<CR>
vnoremap ¿ :call pete#main#comment('Switch')<CR>

command!          R        call pete#main#execute('Repl', '-')
command!          E        call pete#main#execute('Edit', 'a')
command!          O        call pete#main#execute('Options', '-')
command! -nargs=* W wall | call pete#main#path('Execute', g:execute_path, <f-args>)
command! -nargs=* M wall | call pete#main#path('Make', g:make_path, <f-args>)
command! -nargs=* T wall | call pete#main#path('Test', g:test_path, <f-args>)
command! -nargs=? D        call pete#main#debug(<f-args>)
command!          H        call pete#main#execute('Help', 'pete')

command! RH call pete#help#execute('ReplHelp', '-')
command! EH call pete#help#execute('EditHelp', 'a')
command! OH call pete#help#execute('OptionsHelp', '-')
command! CH call pete#help#comment()
command! WH call pete#help#execute('ExecuteHelp', g:execute_path)
command! MH call pete#help#execute('MakeHelp', g:make_path)
command! TH call pete#help#execute('TestHelp', g:test_path)
command! DH call pete#help#execute('DebugHelp', 'pete')

command! -nargs=? WM call pete#mode#execute(<f-args>)
command! -nargs=? MM call pete#mode#make(<f-args>)
command! -nargs=? TM call pete#mode#test(<f-args>)

command! -nargs=? -complete=file WP call pete#path#execute(<f-args>)
command! -nargs=? -complete=file MP call pete#path#make(<f-args>)
command! -nargs=? -complete=file TP call pete#path#test(<f-args>)

command! PETE call pete#modules#editPete()
