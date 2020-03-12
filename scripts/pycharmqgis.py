import getpass
import os
import sys

paths = ':'.join(sys.path). \
    replace('/home/' + getpass.getuser(), '~')

with open('pycharmqgis.sh', 'w') as fileHandler:
    fileHandler.write('export PYTHONPATH=$PYTHONPATH:' + paths)
    fileHandler.write('\n')
    fileHandler.write('sh ~/bin/pycharm')
    fileHandler.write('\n')

os._exit(0)
