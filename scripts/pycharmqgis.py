import getpass
import os
import sys

paths = ':'.join(sys.path). \
    replace(f'/home/{getpass.getuser()}', '~')

with open('pycharmqgis.sh', 'w') as fileHandler:
    fileHandler.write(f'export PYTHONPATH=$PYTHONPATH:{paths}')
    fileHandler.write('\n')
    fileHandler.write('sh ~/jetbrains/pycharm')
    fileHandler.write('\n')

os._exit(0)
