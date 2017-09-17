package app.io.in

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}
import java.util.Properties
import org.apache.spark.sql.SparkSession

import app.utils.Configurator
import com.typesafe.config._

/**
* Purpose: the main entry of the console app
*/
case class RDbReader ( objConfigurator: Configurator ) {

  val objLogger = LoggerFactory.getLogger(classOf[RDbReader])


  def doReadDb () {
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

	spark.read
	 .format("jdbc")
	 .option("url", url )
	 .option("dbtable", "daily_issues")
	 .option("user", user )
	 .option("password", user_pw )
	 .load()

    val connectionProperties = new Properties()
    connectionProperties.put("user", user )
    connectionProperties.put("password", user_pw )

    val jdbcDF2 = spark.read
      .jdbc(url, "daily_issues", connectionProperties)

    msg = "  STOP: doReadDb"
    objLogger.info ( msg )
  }

}
//eof class RDbReader
