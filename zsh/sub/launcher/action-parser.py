# -*- coding: utf-8 -*-

import os, sys, yaml, json


def items():
    defs = os.environ['HOME'] + '/.action-launcher.yaml'

    with open(defs, 'r') as f:
        items = yaml.safe_load(f)

    for item in items:
        print item['name']


def commands(name):
    defs = os.environ['HOME'] + '/.action-launcher.yaml'

    with open(defs, 'r') as f:
        commands = [item for item in yaml.safe_load(f) if item['name'] == name][0]['commands']

    for command in commands:
        print json.dumps(command)


if len(sys.argv) == 2 and sys.argv[1] == 'items':
    items()
elif len(sys.argv) == 3 and sys.argv[1] == 'commands':
    commands(sys.argv[2])

