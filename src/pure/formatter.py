def vertical_align(json):
    max_width_1 = __max_witdh(json, lambda key, element: len(key))
    max_width_2 = __max_witdh(json, lambda key, element: len(element['label']))
    max_width_3 = __max_witdh(json, lambda key, element: len(element['tags']))

    aligned_lines = [__to_line(key, element, max_width_1, max_width_2, max_width_3) for key, element in json.iteritems()]
    aligned_lines.sort()
    return '\n'.join(aligned_lines)


def __max_witdh(json, width):
    return max([width(key, element) for key, element in json.iteritems()])


def __to_line(key, element, max_width_1, max_width_2, max_width_3):
    return ' | '.join([key.rjust(max_width_1), element['label'].ljust(max_width_2), element['tags'].ljust(max_width_3), element['value']])
