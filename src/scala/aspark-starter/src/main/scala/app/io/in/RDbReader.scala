package app.io.in

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
case class RDbReader ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[RDbReader])


  def doReadDb (table: String) :DataFrame = {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

    val objGlobalAppConf = objConfigurator.doGetGlobalAppConfFile
    objLogger.debug ( objGlobalAppConf.toString )

    val url = objGlobalAppConf.getString("dev.db.url" )
    val user = objGlobalAppConf.getString("dev.db.user" )
    val user_pw = objGlobalAppConf.getString("dev.db.user_pw" )

	 val spark = SparkSession
      .builder()
      .appName("Spark SQL basic example")
      .config("spark.some.config.option", "some-value")
      .getOrCreate()

    msg = "  STOP: doReadDb"
    objLogger.info ( msg )
    
	val df = spark.read
      .format("jdbc")
      .option("url", url )
      .option("dbtable", table)
      .option("user", user )
      .option("password", user_pw )
      .load()
   
   objLogger.info ( df.printSchema().toString() )

   df
  }

}
//eof class RDbReader
