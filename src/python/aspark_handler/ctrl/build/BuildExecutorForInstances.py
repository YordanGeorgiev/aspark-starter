import logging
import logging.config
import boto3
from pprint import pprint
from ctrl.build.BuildExecutor import BuildExecutor



class BuildExecutorForInstances(BuildExecutor):
    """This is inherited class from BuildExecutor"""

    def doBuildResources(self,objConfigurator):
      objLogger           = objConfigurator.doInitLogger(self.__class__.__name__)
      objLogger.error ( " instances build not implemented yet")
      objLogger.info ( " stop building instances")

