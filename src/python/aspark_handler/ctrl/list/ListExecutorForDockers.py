import logging
import logging.config
import boto3
from pprint import pprint
from docker import Client

from ctrl.list.ListExecutor import ListExecutor

class ListExecutorForDockers(ListExecutor):
    """This is inherited class from ListExecutor"""

    def doListResources(self,objConfigurator):
      objLogger           = objConfigurator.doInitLogger(self.__class__.__name__)
      cli = Client(base_url='unix://var/run/docker.sock')
      cli.containers()
      objLogger.info ( "STOP listing dockers ")

