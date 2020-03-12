import getpass
import os
import sys

shell_script_path = '/tmp/setup/pycharmqgis.sh'

paths = ':'.join(sys.path). \
    replace('/home/{}'.format(getpass.getuser()), '~')

with open(shell_script_path, 'w') as fileHandler:
    fileHandler.write('export PYTHONPATH=$PYTHONPATH:{}\n'.format(paths))
    fileHandler.write('sh ~/bin/pycharm')

os._exit(0)
