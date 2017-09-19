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
* Resposibility: transform rdd objects
*/
case class RDDTransformer ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[RDDTransformer])

  // add transforming actions defining defs
  
  def doFilterByAttribute ( df: DataFrame , attr: String) {
    var msg = " START: doFilterByAttribute"
    objLogger.info ( msg )
  
    //df.select(*)
     // .option( "header" , "true")

    msg = "  STOP: doFilterByAttribute"
    objLogger.info ( msg )

    
  }

}
//eof class RDDTransformer
