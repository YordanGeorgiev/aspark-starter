# python modules
import logging 
import sys    
import os    
import logging
import logging.config
import boto3
from pprint import pprint
# own modules
from utils.Configurator import Configurator
from ctrl.start.StartExecutor import StartExecutor
from ctrl.start.StartExecutorForInstances import StartExecutorForInstances
from ctrl.start.StartExecutorForDockers import StartExecutorForDockers

"""Factory Design Pattern for the Starting Action for aws resources
"""

class CreateStartExecutor(object):
    """Abstract class of create Start"""

    def createStartExecutor(self):
        raise NotImplementedError("Should Have implemented This")


class StartExecutorFactory(CreateStartExecutor):
    """Class inhretied from CreateStartExecutor"""

    @staticmethod
    def createStartExecutor( arg ):

      if arg == "dockers":
         objStartExecutor=StartExecutorForDockers()
         return objStartExecutor
      elif arg == "instances":
         objStartExecutor=StartExecutorForInstances()
         return objStartExecutor
      else:
         print ( "Use the correct name for StartExecutor" )

