function! dot_hoge_editor#main#launch()
    let g:dot_hoge_taggings_dir = '/Users/ryo/Dropbox/Taggings/'
    let g:dot_hoge_links_dir = '/Users/ryo/Dropbox/Links/'

    let found = dot_hoge_editor#process#read_dot_hoge()

    call dot_hoge_editor#window#launch(found)
endfunction

