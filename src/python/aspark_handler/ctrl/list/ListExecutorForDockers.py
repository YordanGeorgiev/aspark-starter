import logging
import logging.config
import boto3
from pprint import pprint
from ctrl.list.ListExecutor import ListExecutor



class ListExecutorForDockers(ListExecutor):
    """This is inherited class from ListExecutor"""

    def doListResources(self,objConfigurator):
      objLogger           = objConfigurator.doInitLogger(self.__class__.__name__)
      objLogger.info ( "STOP listing dockers ")

