def header():
    return ['# vim:set ft=sh:\n\n']

def comp_func(cmd, ex, note):
    template = [
        '_%(cmd)s() {',
        ' files=( $(find . -name "*.%(ex)s" -type f | cut -c3-) )',
        ' _describe "%(note)s" files',
        '}',
        'compdef _%(cmd)s %(cmd)s\n\n' 
    ]

    return '\n'.join(template) % locals()

if __name__ == '__main__':
    func_defs = [
            {'cmd': 'python', 'ex': 'py',   'note': 'python files'},
            {'cmd': 'sh',     'ex': 'sh',   'note': 'sh files'},
            {'cmd': 'pict',   'ex': 'pict', 'note': 'pict files'}
    ]

    with open('ex_completes', 'w') as f:
        f.writelines(
            header() + [comp_func(**func_def) for func_def in func_defs]
        )
