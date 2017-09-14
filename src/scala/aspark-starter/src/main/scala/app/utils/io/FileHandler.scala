package app.utils.io

import org.slf4j.LoggerFactory
import java.io.File
import scala.collection.JavaConversions._


/**
 *
 * Encapsulates the app global configuration logic
 */
case class FileHandler () {
	
  val objLogger = LoggerFactory.getLogger(classOf[FileHandler])


  /**
   * get the files from dir into array
   * @param f the dir containing the files
   */
	def getFileTree(f: File): Stream[File] =
        f #:: (if (f.isDirectory) f.listFiles().toStream.flatMap(getFileTree) 
               else Stream.empty)



}
//eof class FileHandler
