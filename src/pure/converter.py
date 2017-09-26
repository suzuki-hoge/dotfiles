def mask(json):
    for key, element in json.iteritems():
        element['value'] = __mask_or(element)
    return json


def __mask_or(element):
    view = element.get('view', 'show')
    value = element.get('value')

    if view == 'mask':
        return '***'
    elif 90 < len(value):
        return value[:90] + '...'
    else:
        return value


def to_value(key, json):
    return json.get(key).get('value')
