augroup calendar
	autocmd!
	autocmd BufEnter work.calendar :so $dot/vim/plugin/autoload/calendar/configure.vim | :normal gg0
augroup END


let g:calendar_today_y = strftime('%Y')
let g:calendar_today_m = strftime('%m')
let g:calendar_today_d = strftime('%d')

let g:calendar_request_y = calendar_today_y
let g:calendar_request_m = calendar_today_m

