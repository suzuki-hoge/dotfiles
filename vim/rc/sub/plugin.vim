" vim:set ft=vim:

"source $pete/Buffer
"source $pete/PetroniusTheArbiter

"nnoremap ÷ :call PetroniusTheArbiter($PETE_COMMENT_ON)<CR>
"vnoremap ÷ :call PetroniusTheArbiter($PETE_COMMENT_ON)<CR>

"nnoremap ? :call PetroniusTheArbiter($PETE_COMMENT_OFF)<CR>
"vnoremap ? :call PetroniusTheArbiter($PETE_COMMENT_OFF)<CR>

"nnoremap ¿ :call PetroniusTheArbiter($PETE_COMMENT_SWITCH)<CR>
"vnoremap ¿ :call PetroniusTheArbiter($PETE_COMMENT_SWITCH)<CR>

"command! W wall | call PetroniusTheArbiter($PETE_RUN)

"command! R call PetroniusTheArbiter($PETE_RELOAD)

"command! -nargs=* D call PetroniusTheArbiter($PETE_DEBUG, <f-args>)


source $plugin/autoload/todo/configure.vim

command! -nargs=? -complete=dir F           call frank#main#open(<f-args>)
command!                        FL          call frank#launcher#selector()
command!                        FP          call frank#launcher#current_project()
command!                        FLConfigure call frank#launcher#configure()

augroup regex_complete
	autocmd!
	autocmd BufEnter * :set completefunc=complete#main#func
augroup END

command! H call pete#main#help()
command! -nargs=* W wall | call pete#main#execute(<f-args>)
command! -nargs=* T wall | call pete#main#test(<f-args>)
command! E call pete#main#edit()
command! R call pete#main#repl()
command! -nargs=* M wall | call pete#main#make()
command! O call pete#main#options()
command! -nargs=? D call pete#main#debug(<f-args>)
