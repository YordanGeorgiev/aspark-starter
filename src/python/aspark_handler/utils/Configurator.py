import utils.Initializer
import logging 
import sys    
import os    
import logging
import logging.config
import builtins

# 
# responsible for the global configuration of the tool
class Configurator:

    # the global configuration dictionary ...
    appConfig = dict()


    # the constructor 
    def __init__(self):
        
        self.appConfig = dict()
        self.doInitGlobals()
    #eof __init__


    # populate the global app config 
    def doInitGlobals(self):

        product_name                             = utils.Initializer.doResolveProductName()
        self.appConfig [ 'ProductName' ]         = utils.Initializer.doResolveProductName()
        self.appConfig [ 'ProductInstDir' ]      = utils.Initializer.doResolveProductInstanceDir()
        self.appConfig [ 'ProductConfigFile' ]   = utils.Initializer.doResolveTheConfigFile()
    #eof doInitGlobals



    # a getter for the app config
    def getAppConfig(self):

        return self.appConfig
    #eof getAppConfig


    # a setter for the the app config 
    def setAppConfig ( self , app_config ):
        self.appConfig = app_config
    #eof setAppConfig 


    # initialize a logger
    # src: https://doc.python.org/3.1/library/logging.html
    def doInitLogger(self,module):

        product_inst_dir    = utils.Initializer.doResolveProductInstanceDir()
        logging_conf_file   = product_inst_dir + os.sep + 'cnf/aspark-starter.logger.cnf'

        self.appConfig [ 'LoggingConfFile'] = logging_conf_file
        logging.config.fileConfig(logging_conf_file)
        
        # create logger
        objLogger = logging.getLogger( module )

        return objLogger
    #eof def doInitLogger
