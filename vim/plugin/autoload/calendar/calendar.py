import sys, datetime

ns = map(int, sys.argv[1:6])

req_y = ns[0]
req_m = ns[1]
today_y = ns[2]
today_m = ns[3]
today_d = ns[4]
out = sys.argv[6]

first = datetime.date(req_y, req_m, 1)
today = datetime.date(today_y, today_m, today_d)

left = -((first.weekday() + 1) % 7)
lefts = xrange(left, left + 36, 7)


class Date:
    def __init__(self, v, today, first):
        self.v = v
        self.today = today
        self.first = first

    @staticmethod
    def of(n, today, first):
        return Date(first + datetime.timedelta(days = n), today, first)

    def str(self):
        return '%s%s%s' % (self.__day(), self.__color_label(), self.__today_flag())

    def __day(self):
        return '%2d' % self.v.day

    def __color_label(self):
        if self.v.month != self.first.month:
            return '#'
        elif self.v.weekday() == 5:
            return '>'
        elif self.v.weekday() == 6:
            return '<'
        else:
            return ' '

    def __today_flag(self):
        return '!' if self.v == self.today else ' '


mk = lambda n: Date.of(n, today, first).str()

weeks = [''.join(map(mk, xrange(n, n + 7))) for n in lefts]

with open(out, 'w') as f:
    f.write('                       %d %02d' % (req_y, req_m))
    f.write('\n\n')
    f.write('    Su> Mo  Tu  We  Th  Fr  Sa<')
    f.write('\n\n')
    f.write('\n'.join(map(lambda week: '    ' + week, weeks)))

