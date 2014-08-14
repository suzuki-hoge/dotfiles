" vim:set ft=vim:

function! HtmlElements(ArgLead, CmdLine, CursorPos)
python << EOM

tags = tagComplete()
attributes = attributesComplete()

if isFirstArg():
	toVim(tags)
else:
	toVim(attributes)

EOM
endfunction

python << EOM

def isFirstArg():
	CmdLine = vim.eval('a:CmdLine')
	return True if CmdLine.count(' ') == 1 else False

def toString(func):
	def _toString():
		list = func()
		return "\n".join(list)
	return _toString

@toString
def tagComplete():
	path = vim.eval('$SURR_TAG_TAGS')
	return byList(path, lambda line: True)

@toString
def attributesComplete():
	path = vim.eval('$SURR_TAG_ATTRIBUTES')
	return byList(path, lambda line: isNotDup(line))

def isNotDup(line):
	return line.strip() not in vim.eval('a:CmdLine')

def byList(path, func):
	return [line.strip() for line in open(path).readlines() if func(line)]

def toVim(line):
	vim.command('return "%s"' % line)

EOM
