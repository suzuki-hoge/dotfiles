# -*- coding: utf-8 -*-

import os, sys, yaml, json


def projects():
    with open(os.environ['HOME'] + '/.idea-projects.yaml', 'r') as f:
        projects = yaml.safe_load(f)

    ws = [15, 30, 10, 10, 10, 10, 10]
    for group in projects['groups']:
        for project in group['projects']:
            cols = [group['name'], project['name']] + (project['tags'] or []).split(',')
            for i, col in enumerate(cols):
                print col.strip().ljust(ws[i], ' '),
            print ''


def path(line):
    with open(os.environ['HOME'] + '/.idea-projects.yaml', 'r') as f:
        projects = yaml.safe_load(f)

    group_name = line.split('|')[0].strip()
    project_name = line.split('|')[1].strip()

    for group in projects['groups']:
        for project in group['projects']:
            if group['name'] == group_name and project['name'] == project_name:
                print project['path']


if len(sys.argv) == 2 and sys.argv[1] == 'projects':
    projects()
elif len(sys.argv) == 3 and sys.argv[1] == 'path':
    path(sys.argv[2])

