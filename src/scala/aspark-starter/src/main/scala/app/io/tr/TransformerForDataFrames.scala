package app.io.tr

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}
import java.util.Properties
import com.typesafe.config._

import org.apache.spark.sql.SparkSession
import org.apache.spark.sql.DataFrame

import app.utils.Configurator

/**
* Resposibility: transform rdd objects
*/
case class TransformerForDataFrames ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[TransformerForDataFrames])


  // chk: https://stackoverflow.com/a/36011735/65706
  def doFilterByAttribute ( 
          df: DataFrame , attr_name: String , attr_val: String ) :DataFrame = {

    var msg = " START: doFilterByAttribute"
    objLogger.info ( msg )

    msg = "  STOP: doFilterByAttribute"
    objLogger.info ( msg )

    df.filter( attr_name + " in (\"" + attr_val + "\")")
  }

}
//eof class TransformerForDataFrames
