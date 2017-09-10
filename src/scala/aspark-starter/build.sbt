// file: src/scala/aspark-starter/build.sbt
// http://alvinalexander.com/bookmarks/scala/how-get-anorm-working-without-play-play-framework

// the owner org
organization := "Oranisation Ltd."

// the name of this proj
name := "aspark-starter" 

// the version of this proj
version := "0.0.2"

scalaVersion := "2.11.8"



// ?!
//lazy val root = (project in file(".")).enablePlugins(PlayScala)

// src: http://www.scala-sbt.org/sbt-native-packager/gettingstarted.html
enablePlugins(JavaAppPackaging)
// enablePlugins(UniversalPlugin)

//src: http://stackoverflow.com/a/25534129/65706
resolvers ++= Seq(
"Typesafe Releases" at "http://repo.typesafe.com/typesafe/releases/")

// for apache spark check:
// src: https://stackoverflow.com/a/44644342/65706
libraryDependencies += "com.typesafe" % "config" % "1.3.0"

// resolvers += "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/"
// resolvers += "Typesafe repository" at "https://repo.typesafe.com/typesafe/ivy-releases"





// obs - use comma space <<lib>> syntax for easier copy paste !!!
libraryDependencies ++= Seq ( 
	//logging libs
	  "ch.qos.logback" %  "logback-classic" % "1.1.7"
	, "commons-lang" % "commons-lang" % "2.6"
 	// lib for read and write to csv file files  
)
//eof lib dependancies list 


// Purpose : 
// --------------------------------------------------------
// the sbt build filee for the nettilaskuri maintenance project

// --------------------------------------------------------
// eof file: src/scala/aspark-starter/build.sbt
