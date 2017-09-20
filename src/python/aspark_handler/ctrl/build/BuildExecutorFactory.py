# python modules
import logging 
import sys    
import os    
import logging
import logging.config
from pprint import pprint
# own modules
from utils.Configurator import Configurator
from ctrl.build.BuildExecutor import BuildExecutor
from ctrl.build.BuildExecutorForDockers import BuildExecutorForDockers
from ctrl.build.BuildExecutorForInstances import BuildExecutorForInstances

"""Factory Design Pattern for the Building Action for aws resources
"""

class CreateBuildExecutor(object):
    """Abstract class of create Build"""

    def createBuildExecutor(self):
        raise NotImplementedError("Should Have implemented This")


class BuildExecutorFactory(CreateBuildExecutor):
    """Class inhretied from CreateBuildExecutor"""

    @staticmethod
    def createBuildExecutor( arg ):

      if arg == "dockers":
         objBuildExecutor=BuildExecutorForDockers()
         return objBuildExecutor
      elif arg == "instances":
         objBuildExecutor=BuildExecutorForInstances()
         return objBuildExecutor
      else:
         print ( "Use the correct name for BuildExecutor" )

