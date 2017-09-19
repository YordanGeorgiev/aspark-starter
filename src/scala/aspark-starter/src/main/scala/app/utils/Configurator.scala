package app.utils

import util.control.Breaks._

import ch.qos.logback.core._
import org.slf4j.LoggerFactory
import ch.qos.logback.core.util.StatusPrinter
import ch.qos.logback.classic.LoggerContext

import java.io.File
import com.typesafe.config.Config
import com.typesafe.config.ConfigFactory


/**
 * Purpose: 
 * Encapsulates the app global configuration logic
 */
case class Configurator ( scalaProjKickOffDir: String) {
	
  val scalaProjDir: String = 			doGetScalaProjDir ( scalaProjKickOffDir )
  val product_instance_dir: String = 	doGetProductInstanceDir ( scalaProjDir )
  def getProductInstanceDir = product_instance_dir    //a getter 

  // src: https://www.mkyong.com/logging/logback-set-log-file-name-programmatically/
  System.setProperty("product_instance_dir", product_instance_dir);

  // src: http://alvinalexander.com/scala/how-to-use-java-style-logging-slf4j-scala
  val objLogger = LoggerFactory.getLogger(classOf[Configurator])

  val confDir = scalaProjDir + "/conf" 
  val dataDir = product_instance_dir + "/dat/aspark-starter" 
  val dataCsvDir = product_instance_dir + "/dat/aspark-starter/csv"
  def getDataCsvDir = dataCsvDir

  val csvDirOut = product_instance_dir + "/dat/out"
  def getCsvDirOut = csvDirOut

  val csvDirIn = product_instance_dir + "/dat/in"
  def getCsvDirIn = csvDirIn

  val dbDataDir = dataDir + "/db" 
  val mySqlDataDir = dbDataDir + "/mysql" 
  doLogDirs



  /**
   * Resolve the scala project dir by utilizing the src/scala/proj_name naming convention
   * @param scalaProjKickOffDir 	the dir resolved via reflection from the Main class file
   */
	def doGetScalaProjDir ( scalaProjKickOffDir: String ) :String = {
		val regex = "(.*)(/src/scala/aspark-starter)(.*)".r
		regex.replaceAllIn ( scalaProjKickOffDir , "$1$2")
	}
	//eof def doGetScalaProjDir


  /**
   * Resolve the product version dir hosting one or many scala projects by naming convention
   * @param scalaProjDir 	the dir resolved via reflection from the Main class file
   */
	def doGetProductInstanceDir ( scalaProjDir: String ) :String = {
		val regex = "/src/scala/aspark-starter".r
		regex.replaceAllIn ( scalaProjDir , "")
	}
	//eof def getScalaProductVersionDir
	

  /**
  	* 
   */
	def doGetGlobalAppConfFile = {
		ConfigFactory.parseFile(new File(confDir + "/" + "application.conf"))
	}


  /**
   * @param file 	the file to get the custom config object for
   */
	def doGetCustomConfFile ( file : String ) = {
		ConfigFactory.parseFile( new File ( file ) )
	}


  /**
  	* Just print the run-time resolved dir configuration
   */
	def doLogDirs = {

		var msg = " scalaProjDir: " + scalaProjDir
		objLogger.info ( msg ) 

		msg = " confDir: " + confDir
		objLogger.info ( msg ) 

		msg = " product_instance_dir: " + product_instance_dir
		objLogger.info ( msg ) 

		msg = " dataDir: " + dataDir
		objLogger.info ( msg ) 

		msg = " dbDataDir: " + dbDataDir
		objLogger.info ( msg ) 

	}
	//eof def doLogDirs


}
//eof class Configurator
