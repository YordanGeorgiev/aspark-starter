package app.io.out

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}
import org.apache.spark.sql.DataFrame

import app.utils.Configurator
import com.typesafe.config._

/**
* Purpose: 
*/
case class HDFSWriter ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[HDFSWriter])


  /**
   * Resolve the scala project dir by utilizing the src/scala/proj_name naming convention
   * @param df 	the org.apache.spark.sql.DataFrame obj to write a file for
   * @param fileName 	the file name to use 
   */
  def doWriteFile (df: DataFrame , fileName: String) {

    var msg = " START: doWriteFile"
    objLogger.info ( msg )
  
    val file = "/var/aspark-starter/dat/" + fileName
    objLogger.info ( "saving to the following file " + file ) 
  
    // see: https://stackoverflow.com/a/38323127/65706
    df.coalesce(1).write
    .option("header", "true")
    .mode("overwrite")
    .csv("hdfs://localhost:54310" + file )

    msg = " STOP : doWriteFile"
    objLogger.info ( msg )
  }

}
//eof class RDbReader
