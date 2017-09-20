#! env python

import sys    
sys.path.append(".")
import os    
import time
import logging
import logging.config
import warnings
import argparse
from pprint import pprint


# import own modules
from utils.Configurator import Configurator
from ctrl.list.ListExecutorFactory import ListExecutorFactory
from ctrl.start.StartExecutorFactory import StartExecutorFactory

# this is the main entry point of the tool
def main():
  
   objConfigurator = Configurator()
   objConfigurator.doInitGlobals()

   # debug pprint (vars( objConfigurator ))
   # time.sleep ( 3 )

   objLogger = objConfigurator.doInitLogger(__package__)
   appConfig = objConfigurator.getAppConfig()
   product_name = appConfig [ 'ProductName' ]
   objLogger.info ( "START ::: " + product_name )

   objArgumentParser = argparse.ArgumentParser()

   objArgumentParser.add_argument("-l" , "--list", required=False , 
      help="lists resources your aws account has access to")
   objArgumentParser.add_argument("-s" , "--start", required=False , 
      help="starts resources your aws account has access to")
   args = objArgumentParser.parse_args()

   # objListExecutor = ListExecutorFactory.createListExecutor(args.list)
   objStartExecutor = StartExecutorFactory.createStartExecutor(args.start)
   warnings.simplefilter("ignore", ResourceWarning)
   # objListExecutor.doListResources(objConfigurator)
   objStartExecutor.doStartResources(objConfigurator)

   ret = 0
   objLogger.info ( "STOP  ::: " + product_name )
   exit ( ret )
#eof main


# Action !!!
main()
