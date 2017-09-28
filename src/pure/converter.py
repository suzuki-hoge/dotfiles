def mask(json):
    for line_id, line in json.iteritems():
        line['value'] = __mask_or(line)
    return json


def __mask_or(line):
    view = line.get('view', 'show')
    value = line.get('value')

    if view == 'mask':
        return '***'
    elif 90 < len(value):
        return value[:90] + '...'
    else:
        return value


def to_value(line_id, json):
    return json.get(line_id).get('value')
