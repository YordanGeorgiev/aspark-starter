package app.ctrl

import ch.qos.logback.core._
import org.slf4j.LoggerFactory


import app.utils.Configurator
import app.io.in.RDbReader
import app.io.out.FileWriter
import app.io.out.HDFSWriter

import org.apache.log4j.{Level, Logger}

/**
* Purpose: a controller for the rdbms -> hdfs file etl action
*/
case class RDbToHDFSController ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[RDbToHDFSController])


  def doProcessData () {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objRDbReader = new RDbReader ( objConfigurator ) 
    val objHDFSWriter = new HDFSWriter ( objConfigurator ) 

    val arr = Array("daily_issues", "monthly_issues", "weekly_issues")
    arr.foreach{
      x => var item = x; 
      val df = objRDbReader.doReadDb( item )
      objHDFSWriter.doWriteFile( df , item )
    }

    msg = "  STOP: doProcessData"
    objLogger.info ( msg )
  }

}
//eof class RDbToHDFSController
