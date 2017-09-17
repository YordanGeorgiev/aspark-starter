package app.io.tr

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}
import java.util.Properties
import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.DataFrame
import app.utils.Configurator
import com.typesafe.config._

/**
* Purpose: the main entry of the console app
*/
case class DataFrameTransformer ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[DataFrameTransformer])


  // chk: https://stackoverflow.com/a/36011735/65706
  def doFilterByAttribute ( df: DataFrame , attr: String) {
    var msg = " START: doFilterByAttribute"
    objLogger.info ( msg )
  
    //df.select(*)
     // .option( "header" , "true")

    msg = "  STOP: doFilterByAttribute"
    objLogger.info ( msg )

    
  }

}
//eof class DataFrameTransformer
