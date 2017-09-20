# python modules
import logging 
import sys    
import os    
import logging
import logging.config
from pprint import pprint
# own modules
from utils.Configurator import Configurator
from ctrl.list.ListExecutor import ListExecutor
from ctrl.list.ListExecutorForDockers import ListExecutorForDockers
from ctrl.list.ListExecutorForInstances import ListExecutorForInstances

"""Factory Design Pattern for the Listing Action for aws resources
"""

class CreateListExecutor(object):
    """Abstract class of create List"""

    def createListExecutor(self):
        raise NotImplementedError("Should Have implemented This")


class ListExecutorFactory(CreateListExecutor):
    """Class inhretied from CreateListExecutor"""

    @staticmethod
    def createListExecutor( arg ):

      if arg == "dockers":
         objListExecutor=ListExecutorForDockers()
         return objListExecutor
      elif arg == "instances":
         objListExecutor=ListExecutorForInstances()
         return objListExecutor
      else:
         print ( "Use the correct name for ListExecutor" )

