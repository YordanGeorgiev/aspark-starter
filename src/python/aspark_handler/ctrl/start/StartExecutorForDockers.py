import logging
from pprint import pprint
import boto3

from ctrl.start.StartExecutor import StartExecutor

class StartExecutorForDockers(StartExecutor):
   """This is inherited class from StartExecutor"""

   def doStartResources(self,objConfigurator):
      objLogger  = objConfigurator.doInitLogger(self.__class__.__name__)
      objLogger.info ( "INFO ::: STOP  starting dockers" )

