import logging
import logging.config
from pprint import pprint
import docker

from ctrl.build.BuildExecutor import BuildExecutor

class BuildExecutorForDockers(BuildExecutor):
    """This is inherited class from BuildExecutor"""

    def doBuildResources(self,objConfigurator):
      objLogger           = objConfigurator.doInitLogger(self.__class__.__name__)
      client = docker.from_env()
      objLogger.info ( "STOP building dockers ")

