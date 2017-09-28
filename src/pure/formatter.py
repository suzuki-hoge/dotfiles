def vertical_align(json):
    max_width_1 = __max_witdh(json, lambda line_id, line: len(line_id))
    max_width_2 = __max_witdh(json, lambda line_id, line: len(line['label']))
    max_width_3 = __max_witdh(json, lambda line_id, line: len(line['tags']))

    aligned_lines = [__to_line(line_id, line, max_width_1, max_width_2, max_width_3) for line_id, line in json.iteritems()]
    aligned_lines.sort()
    return '\n'.join(aligned_lines)


def __max_witdh(json, width):
    return max([width(line_id, line) for line_id, line in json.iteritems()])


def __to_line(line_id, line, max_width_1, max_width_2, max_width_3):
    return ' | '.join([line_id.rjust(max_width_1), line['label'].ljust(max_width_2), line['tags'].ljust(max_width_3), line['value']])
