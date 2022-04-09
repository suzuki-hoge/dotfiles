from os.path import expanduser, isfile
from commands import getoutput

xml = '/Library/Application Support/JetBrains/IntelliJIdea2021.1/options/recentProjects.xml'

with open('%s/%s' % (expanduser('~'), xml), 'r') as f:
    lines = f.read().splitlines()

length = 0
projects = []

for line in lines:
    if 'USER_HOME' in line and 'entry' in line:
        path = '%s/%s' % (expanduser('~'), '/'.join(line.split('/')[1:])[:-2])

        name_file = path + '/.idea/.name'
        top_iml = getoutput("ls %s/*.iml" % path)
        idea_iml = getoutput("ls %s/.idea/*.iml" % path)

        if isfile(name_file):
            name = getoutput('cat %s' % name_file)

        elif 'No such file' not in top_iml:
            name = top_iml.split('/')[-1][:-4]

        elif 'No such file' not in idea_iml:
            name = idea_iml.split('/')[-1][:-4]

        else:
            name = path.split('/')[-1]

        length = max(length, len(name))

        projects.append((name, path))

for (name, path) in sorted(projects):
    print '%s | %s' % (name.ljust(length, ' '), path)

