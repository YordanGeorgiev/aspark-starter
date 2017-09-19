package app.ctrl

import ch.qos.logback.core._
import org.slf4j.LoggerFactory


import app.utils.Configurator
import app.io.in.ReaderForRDBMS
import app.io.tr.TransformerForDataFrames
import app.io.out.WriterForPOSIXfiles
import app.io.out.WriterForHDFS

import org.apache.log4j.{Level, Logger}

/**
* Purpose: a controller for the rdbms -> hdfs file etl action
*/
case class ControllerForRDBMStoHDFS ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[ControllerForRDBMStoHDFS])


  /** 
   * controls the reading from RDBMS into data frame objects 
   * transformation on the df objs by filtering 
   * and saving into hdfs files
  */
  def doProcessData () {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objReaderForRDBMS = new ReaderForRDBMS ( objConfigurator ) 
    val objWriterForHDFS = new WriterForHDFS ( objConfigurator ) 
    val objTransformerForDataFrames = new TransformerForDataFrames ( objConfigurator ) 

    val arr = Array("daily_issues", "monthly_issues", "weekly_issues")
    arr.foreach{
      x => var item = x; 
      val df = objReaderForRDBMS.doReadDb( item )
      val df1 = objTransformerForDataFrames.doFilterByAttribute( df , "status" , "09-done")
      objWriterForHDFS.doWriteFile( df1 , item )
    }

    msg = "  STOP: doProcessData"
    objLogger.info ( msg )
  }
  
}
//eof class ControllerForRDBMStoHDFS
