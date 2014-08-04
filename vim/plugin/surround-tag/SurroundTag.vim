" vim:set ft=vim:

source $surroundtag/HtmlElements.vim

let $SURR_TAG_TAGS = $surroundtag . '/tags.txt'
let $SURR_TAG_ATTRIBUTES = $surroundtag . '/attributes.txt'

let $SURR_TAG_NORMAL = 'normal'
let $SURR_TAG_VISUAL = 'visual'

function! SurroundTag(mode, ...) range
python << EOM

if isHtml():
	tag = getTag()
	attributes = getAttributes()

	tags = createHtmlTags(tag, attributes)
	if isNormal():
		surroundAtNormal(tags)
	else:
		surroundAtVisual(tags)

else:
	print 'this command operate at only html.'

EOM

endfunction

python << EOM

def isHtml():
	return vim.eval('&filetype') in ['html', 'htmldjango']
	
def getTag():
	return vim.eval('a:000')[0]

def getAttributes():
	return vim.eval('a:000')[1:]

def isNormal():
	return vim.eval('a:mode') == vim.eval('$SURR_TAG_NORMAL')

def getCurrentLine(num):
	return vim.current.buffer[num - 1]

def createHtmlTags(tag, attributes):
	attributes = [convert(attribute) for attribute in attributes]

	open = '<%s %s >' % (tag, ' '.join(attributes))
	close = '</%s>' % tag

	return (open, close)

def convert(attribute):
	format = '%s' if '=' in attribute else '%s=""'
	return format % attribute

def surroundAtNormal(tags):
	vim.command('normal I%s' % tags[0])
	vim.command('normal A%s' % tags[1])

def surroundAtVisual(tags):
	f = int(vim.eval('a:firstline'))
	l = int(vim.eval('a:lastline'))

	vim.command('normal %sgg' % f)
	vim.command('normal O%s' % tags[0])
	vim.command('normal o%s' % tags[1])

	vim.command(':%sm %s' % (f + 1, l + 2))
	vim.command('%s, %snormal >>' % (f + 1, l + 1))

EOM
