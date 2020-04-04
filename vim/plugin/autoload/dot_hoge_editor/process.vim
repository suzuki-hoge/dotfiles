function! dot_hoge_editor#process#read_dot_hoge()
    let root = g:dot_hoge_taggings_dir
    let dirs = s:sub_dirs(root)
    let names   = []
    let tags    = []
    let githubs = []
    let pubs    = []

    for dir in dirs
        " name:
        call add(names,   substitute(dir, root . '/', '', ''))

        " tag:
        call add(tags,    dot_hoge_editor#read#tag(dir, ','))

        " github:
        call add(githubs, dot_hoge_editor#read#github(dir))

        " pub: explicit or gist
        if dot_hoge_editor#read#pub(dir) != ''
            call add(pubs, dot_hoge_editor#read#pub(dir))
        else
            call add(pubs, dot_hoge_editor#read#gist(dir))
        endif

        for sub in s:sub_dirs(dir)
            "
            if dot_hoge_editor#read#any_dot_hoge_file_exists(sub)
                " name:
                call add(names,   substitute(sub, root . '/', '', ''))

                " tag: inherited and own | own ( maybe empty )
                if dot_hoge_editor#read#tag(dir, ':') != ''
                    call add(tags, dot_hoge_editor#read#tag(dir, ',') . ':' . dot_hoge_editor#read#tag(sub, ','))
                else
                    call add(tags, dot_hoge_editor#read#tag(sub, ','))
                endif

                " github: -- inherited -- | own ( maybe empty )
                if dot_hoge_editor#read#github(dir) != ''
                    call add(githubs, '-- inherited --')
                else
                    call add(githubs, dot_hoge_editor#read#github(sub))
                endif

                " pub: own explict or own gist
                if dot_hoge_editor#read#pub(sub) != ''
                    call add(pubs, dot_hoge_editor#read#pub(sub))
                else
                    call add(pubs, dot_hoge_editor#read#gist(sub))
                end
            endif
        endfor
    endfor

    return {'names': names, 'tags': tags, 'githubs': githubs, 'pubs': pubs}
endfunction


function! s:sub_dirs(dir)
    return filter(split(expand(a:dir . '/*'), '\n'), {_, found -> isdirectory(found)})
endfunction


function! dot_hoge_editor#process#write_dot_hoge_all()
    let found = s:from_buffer()

    let i = 0
    while i < found.n
        call dot_hoge_editor#write#tag(found.dirs[i], found.tags[i])
        call dot_hoge_editor#write#pub(found.dirs[i], found.pubs[i])
        let i += 1
    endwhile
endfunction


function! dot_hoge_editor#process#link_dot_hoge_all()
    call dot_hoge_editor#link#clean_all(g:dot_hoge_links_dir)

    let found = s:from_buffer()
    let tag_master = dot_hoge_editor#read#tag_master_dict()

    let i = 0
    while i < found.n
        for tag in split(found.tags[i], ',')
            call s:link(i, found.dirs[i], s:tag_category(tag_master, tag), tag, found.names[i])
        endfor
        if found.pub_types[i] != ''
            call s:link(i, found.dirs[i], 'published', found.pub_types[i], found.names[i])
        endif

        let i += 1
    endwhile
endfunction


function! s:tag_category(tag_master, tag)
    let found = get(a:tag_master, a:tag)
    return found == '0' ? '_else' : found
endfunction


function! s:link(i, src_dir, link_category, link_name, dst_name)
    call dot_hoge_editor#link#apply(a:i, a:src_dir, g:dot_hoge_links_dir, a:link_category, a:link_name, substitute(a:dst_name, '/', '_', ''))
endfunction


function! s:from_buffer()
    call dot_hoge_editor#process#switch_buf('name')
    let names = getline(0, line('$'))
    let dirs = map(copy(names), {_, name -> g:dot_hoge_taggings_dir . name})

    call dot_hoge_editor#process#switch_buf('tag')
    let tags = map(getline(0, line('$')), {_, tag -> substitute(tag, '[^:]*:', '', '')})

    call dot_hoge_editor#process#switch_buf('pub')
    let pubs = getline(0, line('$'))
    let pub_types = map(copy(pubs), {_, pub -> pub == '' ? '' : s:pub_types(pub)})

    return {'n': len(dirs), 'names': names, 'dirs': dirs, 'tags': tags, 'pubs': pubs, 'pub_types': pub_types}
endfunction


function! s:pub_types(pub)
    let url = split(a:pub, ' : ')[1]

    if     url =~ 'qiita'      | return 'qiita'
    elseif url =~ 'gist'       | return 'gist'
    elseif url =~ 'slideshare' | return 'slideshare'
    elseif url =~ 'github'     | return 'github'
    else                       | return ''
endfunction


function! dot_hoge_editor#process#switch_buf(name)
    execute bufwinnr(a:name) . 'wincmd w'
endfunction

