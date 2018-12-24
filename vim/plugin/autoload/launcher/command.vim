command! L  call launcher#main#subs()
command! LL call launcher#main#vimls()

command! -nargs=? MkViml call launcher#viml#create(<f-args>)
