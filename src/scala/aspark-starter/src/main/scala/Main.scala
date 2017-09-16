package app 

import ch.qos.logback.core._
import org.slf4j.LoggerFactory

import app.utils.Configurator
import app.utils.io.FileHandler
import app.ctrl.FileSystemController

import org.apache.spark.sql.SparkSession
import java.util.Properties

/**
* Purpose: the main entry of the console app
*/
object Main extends App {

  // chk: better way of resolving the main class
  val scalaProjKickOffDir = 
  getClass().getProtectionDomain().getCodeSource().getLocation().toURI().getPath().toString()

  // doc: START :: foreach db 
  val objConfigurator = new Configurator ( scalaProjKickOffDir ) 
	
  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[App])
  var msg = " START: aspark-starter App"
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

	 //connectionProperties.put("driver", "org.postgresql.Driver") 
    connectionProperties.put("user", "postgres")
    connectionProperties.put("password", "secret")

    val jdbcDF2 = spark.read
      .jdbc("jdbc:postgresql:dev_aspark_starter", "daily_issues", connectionProperties)

  //val objFileSystemController = new FileSystemController ( objConfigurator )
  // objFileSystemController.doProcessFiles

  msg = "  STOP: aspark-starter App"
  objLogger.info ( msg )

}
//eof obj Main
