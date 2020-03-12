import getpass
import os
import sys

paths = ':'.join(sys.path). \
    replace('/home/{}'.format(getpass.getuser()), '~')

with open('pycharmqgis.sh', 'w') as fileHandler:
    fileHandler.write('export PYTHONPATH=$PYTHONPATH:{}\n'.format(paths))
    fileHandler.write('sh ~/bin/pycharm')

os._exit(0)
