import os

templates = [
    {
        'path': 'zsh/local.zsh',
        'body': ''
    },
    {
        'path': 'karabiner/local.xml',
        'body': '<?xml version="1.0"?>\n<root>\n</root>'
    },
    {
        'path': 'vim/local.vim',
        'body': ''
    }
]
directories = [
    'filterable-book',
    'bin'
]

def touch_if_not_exists(template):
    path = os.path.join(os.path.expanduser('~'), '.dotfiles', template['path'])

    if not os.path.exists(path):
        os.makedirs(os.path.dirname(path))
        with open(path, 'w') as file:
            file.write(template['body'])
        print 'init: %s' % path
    else:
        print 'already exists: %s' % path

def mkdir_if_not_exists(directory):
    path = os.path.join(os.path.expanduser('~'), '.dotfiles', directory)

    if not os.path.exists(path):
        os.makedirs(path)
        print 'mkdir: %s' % path
    else:
        print 'already exists: %s' % path

[touch_if_not_exists(template) for template in templates]
[mkdir_if_not_exists(directory) for directory in directories]
