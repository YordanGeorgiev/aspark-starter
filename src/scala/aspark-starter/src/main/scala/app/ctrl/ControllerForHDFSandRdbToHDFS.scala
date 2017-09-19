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
* Purpose: a controller for the hdfs + rdbms -> join dataframes
* -> hdfs writee files
*/
case class ControllerForHDFSandRdbToHDFS ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[ControllerForHDFSandRdbToHDFS])


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

    // val df1 = objReaderForRDBMS.doReadDb( "daily_issues" )
    // val df2 = objHDFSReader.doReadFile( "daily_issues" )
    // val df3 = objTransformerForDataFrames.doInnerJoinByAttribute( df1 , df2, "status" , "09-done")
    // objWriterForHDFS.doWriteFile( df3 , item )

    msg = "  STOP: doProcessData"
    objLogger.info ( msg )
  }
  
}
//eof class ControllerForHDFSandRdbToHDFS
