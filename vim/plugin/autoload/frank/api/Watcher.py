import time
import os

from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer

import shelve

from Manager import Manager

# todo sys.argv[1]
ROOT = '/Users/ryo/Documents/tmp/entries-sample'
INTERVAL = 1

class ChangeHandler(FileSystemEventHandler):

	def on_created(self, event):
		update(ROOT)

	def on_moved(self, event):
		update(ROOT)

	def on_deleted(self, event):
		update(ROOT)

def update(path):
	manager = Manager(path)

	shelf = shelve.open('./shelf')
	shelf[path] = manager
	shelf.close()

if __name__ in '__main__':
	while True:
		event_handler = ChangeHandler()
		observer = Observer()
		observer.schedule(event_handler, ROOT, recursive = True)
		observer.start()

		try:
			while True:
				time.sleep(INTERVAL)
		except KeyboardInterrupt:
			observer.stop()
		observer.join()
