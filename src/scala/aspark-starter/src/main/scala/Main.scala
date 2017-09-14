package app 

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import ch.qos.logback.core.util.StatusPrinter
import ch.qos.logback.classic.LoggerContext
import scala.collection.mutable.Map


import java.io.File
import app.utils.Configurator
import app.utils.io.FileHandler

import org.apache.spark.SparkContext
import org.apache.spark.SparkConf

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

  val ProductInstanceDir = objConfigurator.getProductInstanceDir
  msg = " ProductInstanceDir: " + ProductInstanceDir
  objLogger.info ( msg )

  val dataCsvDir = objConfigurator.getDataCsvDir
  msg = " DataCsvDir: " + dataCsvDir
  objLogger.info ( msg )


  val conf = new SparkConf().setMaster("local[*]").setAppName("AsparkStarter")
  val sc = new SparkContext(conf)


  val objFileHandler = new FileHandler () 
  objFileHandler.getFileTree( new File ( dataCsvDir ) )
      .filter(_.getName.endsWith(".csv"))
		  .foreach{
          x => var f = x; /* some operation */
          var str_file_path = "file://" + f.getAbsolutePath()
          objLogger.debug ( "str_file_path: " + str_file_path )  
		    val lines = sc.textFile( str_file_path )
          val line_lengths = lines.map(s => s.length)
          val total_length = line_lengths.reduce((a, b) => a + b)
          objLogger.debug ( "total_length: " + total_length )  
  }

  sc.stop()

  msg = "  STOP: aspark-starter App"
  objLogger.info ( msg )

}
//eof obj Main
