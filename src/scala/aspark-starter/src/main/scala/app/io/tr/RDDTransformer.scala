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
  
  def doFilterByAttribute ( df: DataFrame , attr_name: String , attr_val: String):DataFrame = {
    var msg = " START: doFilterByAttribute"
    objLogger.info ( msg )

    msg = "  STOP: doFilterByAttribute"
    objLogger.info ( msg )
    df
  }

}
//eof class RDDTransformer
