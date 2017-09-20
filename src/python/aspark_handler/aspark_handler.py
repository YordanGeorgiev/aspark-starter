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
from ctrl.build.BuildExecutorFactory import BuildExecutorFactory

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
      help="lists resources ")
   objArgumentParser.add_argument("-s" , "--start", required=False , 
      help="starts resources ")
   objArgumentParser.add_argument("-b" , "--build", required=False , 
      help="builds resources ")
   args = objArgumentParser.parse_args()

   flg_found=0
   ret=0
   for k in args.__dict__:

      if args.build != None:
        objBuildExecutor = BuildExecutorFactory.createBuildExecutor(args.build)
        objBuildExecutor.doBuildResources(objConfigurator)
        flg_found = flg_found + 1

      elif args.start != None:
        objStartExecutor = StartExecutorFactory.createStartExecutor(args.start)
        objStartExecutor.doStartResources(objConfigurator)
        flg_found = flg_found + 1

      elif args.list != None:
        objListExecutor = ListExecutorFactory.createListExecutor(args.list)
        objListExecutor.doListResources(objConfigurator)
        flg_found = flg_found + 1

      else:
        if flg_found > 0:
            ret = 0
            objLogger.info ( "STOP  ::: " + product_name )
        else:
            ret = 1
            objLogger.fatal( "STOP  ::: " + product_name )
            exit ( ret )

      exit ( ret )
      warnings.simplefilter("ignore", ResourceWarning)

#eof main


# Action !!!
main()
