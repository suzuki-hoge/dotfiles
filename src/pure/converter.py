def to_lines(json):
    return '\n'.join([__to_line(key, element) for key, element in json.iteritems()])


def __to_line(key, element):
    return '%s, %s, %s, %s' % (key, __label(element), __tags(element), __value(element))


def __label(element):
    return element['label']


def __tags(element):
    return ' / '.join(element['tags'])


def __value(element):
    view = element['view']
    value = element['value']

    if view == 'cut' and 90 < len(value):
        return value[:90] + '...'
    elif view == 'mask':
        return '***'
    else:
        return value


def to_value(line, json):
    key = line.split(',')[0]
    return json[key]['value']
