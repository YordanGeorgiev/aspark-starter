import logging
import logging.config
import boto3
from pprint import pprint
from ctrl.start.StartExecutor import StartExecutor



class StartExecutorForInstances(StartExecutor):
    """This is inherited class from StartExecutor"""

    def doStartResources(self,objConfigurator):
        objLogger           = objConfigurator.doInitLogger(self.__class__.__name__)
        objLogger.info ( "STOP  starting instances" )
