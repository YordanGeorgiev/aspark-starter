package app 

import ch.qos.logback.core._
import org.slf4j.LoggerFactory

import app.utils.Configurator
import app.utils.io.FileHandler
import app.ctrl.ControllerForPOSIXFiles
import app.ctrl.ControllerForRDBMStoFS
import app.ctrl.ControllerForRDBMStoHDFS


/**
* Purpose: the main entry of the console app
*/
object Main extends App {

  // chk: better way of resolving the main class
  val scalaProjKickOffDir = 
  getClass().getProtectionDomain().getCodeSource().getLocation().toURI().getPath().toString()

  val objConfigurator = new Configurator ( scalaProjKickOffDir ) 
	
  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[App])
  var msg = " START: aspark-starter App"
  objLogger.info ( msg )

  args.foreach {
    x => var action = x;

    action match {

      case "read-and-modify-posix-files" => {
        val objControllerForPOSIXFiles = new ControllerForPOSIXFiles ( objConfigurator )
        objControllerForPOSIXFiles.doProcessData

      }
      case "read-rdbms-to-posix-files" => {
        val objControllerForRDBMStoFS = new ControllerForRDBMStoFS ( objConfigurator ) 
        objControllerForRDBMStoFS.doProcessData()

      }
      case "read-rdbms-to-hdfs-files" => {
        val objControllerForRDBMStoHDFS = new ControllerForRDBMStoHDFS ( objConfigurator )
        objControllerForRDBMStoHDFS.doProcessData()

      }
    } //eof match

  } //eof foreach

  msg = "  STOP: aspark-starter App"
  objLogger.info ( msg )
  
  // Thread.sleep(150000)

}
//eof obj Main
