package app.ctrl

import ch.qos.logback.core._
import org.slf4j.LoggerFactory


import app.utils.Configurator
import app.io.in.RDbReader

import org.apache.log4j.{Level, Logger}

/**
* Purpose: the main entry of the console app
*/
case class RdbToFSController ( objConfigurator: Configurator ) {

  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[RdbToFSController])


  def doProcessData () {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objRDbReader = new RDbReader ( objConfigurator ) 
    objRDbReader.doReadDb()

    msg = "  STOP: doProcessData"
    objLogger.info ( msg )
  }
  

}
//eof class RdbToFSController
