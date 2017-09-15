package app 

import ch.qos.logback.core._
import org.slf4j.LoggerFactory

import app.utils.Configurator
import app.utils.io.FileHandler
import app.ctrl.FileSystemController


/**
* Purpose: the main entry of the console app
*/
object Main extends App {

  // chk: better way of resolving the main class
  val scalaProjKickOffDir = 
  getClass().getProtectionDomain().getCodeSource().getLocation().toURI().getPath().toString()

  // doc: START :: foreach db 
  val objConfigurator = new Configurator ( scalaProjKickOffDir ) 
	
  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[App])
  var msg = " START: aspark-starter App"
  objLogger.info ( msg )

  val objFileSystemController = new FileSystemController ( objConfigurator )
  objFileSystemController.doProcessFiles

  msg = "  STOP: aspark-starter App"
  objLogger.info ( msg )

}
//eof obj Main
