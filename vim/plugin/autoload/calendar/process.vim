function! calendar#process#next()
    if g:calendar_request_m == 12
        let g:calendar_request_y += 1
        let g:calendar_request_m = 1
    else
        let g:calendar_request_m += 1
    endif

    call calendar#process#draw()
endfunction


function! calendar#process#prev()
    if g:calendar_request_m == 1
        let g:calendar_request_y -= 1
        let g:calendar_request_m = 12
    else
        let g:calendar_request_m -= 1
    endif

    call calendar#process#draw()
endfunction


function! calendar#process#draw()
    let command = join(['python', $dot . "/vim/plugin/autoload/calendar/calendar.py", g:calendar_request_y, g:calendar_request_m, g:calendar_today_y, g:calendar_today_m, g:calendar_today_d, '/tmp/work.calendar'], ' ')
    call system(command)

    execute 'normal ggdG'
    read /tmp/work.calendar
    execute 'normal ggdd0'
endfunction

