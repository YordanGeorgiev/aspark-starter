package app.ctrl

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}

import app.utils.Configurator
import app.io.in.ReaderForPOSIXfiles

/**
* Purpose: 
* a controller for the rdbms -> fs file etl action
*/
case class ControllerForPOSIXFiles ( objConfigurator: Configurator ) {

  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[ControllerForPOSIXFiles])


  def doProcessData {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objReaderForPOSIXfiles = new ReaderForPOSIXfiles ( objConfigurator ) 
    objReaderForPOSIXfiles.doProcessFiles

    msg = " STOP: doProcessData"
    objLogger.info ( msg )
  }


}
//eof class ControllerForPOSIXFiles
