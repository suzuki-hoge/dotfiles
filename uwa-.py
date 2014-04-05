import os
import os.path
import shutil

HOME = os.path.expandvars('$HOME')
URL = 'git://github.com/tenshiPure/dotfiles.git'
SRC_ROOT = 'tmp_clone_files'
SRC_ZSH = '%s/zsh' % SRC_ROOT
SRC_ZSH_SUB = '%s/zsh/sub' % SRC_ROOT
DOT_ROOT = '%s/.dotfiles' % HOME
DOT_ZSH = '%s/zsh' % DOT_ROOT

def clone():
	print '\ncloning...\n'

	os.system('git clone %s ./%s' % (URL, SRC_ROOT))

def mkdir():
	print '\nmaking directory...\n'

	for src in [DOT_ROOT, DOT_ZSH]:
		print 'mkdir %s' % src
		try:
			os.mkdir('%s' % src)
		except:
			pass

def move():
	print '\nmoving...\n'

	_move(SRC_ZSH, HOME)
	_move(SRC_ZSH_SUB, DOT_ZSH)

def _move(src_dir, dst_dir):
	for file in os.listdir(src_dir):
		if os.path.isfile('%s/%s' % (src_dir, file)):
			src = '%s/%s' % (src_dir, file)
			dst = '%s/%s' % (dst_dir, file)

			print 'mv %s - %s' % (src, dst)
			shutil.copy(src, dst)

def close():
	print '\ncleaning...\n'

	print 'rm -rf %s' % SRC_ROOT
	shutil.rmtree(SRC_ROOT)

	print '\nall tasks finished.\n'

if __name__ == '__main__':
	print 'start uwa-.py'

	clone()
	mkdir()
	move()
	close()
