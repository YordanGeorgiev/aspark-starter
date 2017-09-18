package app.ctrl

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}

import app.utils.Configurator
import app.io.in.FileReader

/**
* Purpose: 
* to demontrate reading of POSIX files with spark
*/
case class FileSystemController ( objConfigurator: Configurator ) {

  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[FileSystemController])


  def doProcessData {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objFileReader = new FileReader ( objConfigurator ) 
    objFileReader.doProcessFiles

    msg = " STOP: doProcessData"
    objLogger.info ( msg )
  }


}
//eof class FileSystemController
