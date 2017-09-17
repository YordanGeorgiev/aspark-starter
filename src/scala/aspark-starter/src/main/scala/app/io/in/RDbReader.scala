package app.io.in

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import org.apache.log4j.{Level, Logger}
import java.util.Properties
import org.apache.spark.sql.SparkSession

import app.utils.Configurator

/**
* Purpose: the main entry of the console app
*/
case class RDbReader ( objConfigurator: Configurator ) {

  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[RDbReader])


  def doReadDb () {
    var msg = " START: doProcessData"
    objLogger.info ( msg )

	val spark = SparkSession
	 .builder()
	 .appName("Spark SQL basic example")
	 .config("spark.some.config.option", "some-value")
	 .getOrCreate()

	spark.read
	 .format("jdbc")
	 .option("url", "jdbc:postgresql:dev_aspark_starter")
	 .option("dbtable", "daily_issues")
	 .option("user", "postgres")
	 .option("password", "secret")
	 .load()

    val connectionProperties = new Properties()
    connectionProperties.put("user", "postgres")
    connectionProperties.put("password", "secret")

    val jdbcDF2 = spark.read
      .jdbc("jdbc:postgresql:dev_aspark_starter", "daily_issues", connectionProperties)

    msg = "  STOP: doReadDb"
    objLogger.info ( msg )
  }

}
//eof class RDbReader
