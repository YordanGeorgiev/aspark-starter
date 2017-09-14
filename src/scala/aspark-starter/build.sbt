// file: src/scala/aspark-starter/build.sbt

// the owner org
organization := "Oranisation Ltd."

// the name of this proj
name := "aspark-starter" 

// the version of this proj
version := "0.0.4"

scalaVersion := "2.11.8"


// src: http://www.scala-sbt.org/sbt-native-packager/gettingstarted.html
enablePlugins(JavaAppPackaging)
// enablePlugins(UniversalPlugin)

//src: http://stackoverflow.com/a/25534129/65706
resolvers ++= Seq(
"Typesafe Releases" at "http://repo.typesafe.com/typesafe/releases/")

libraryDependencies ++= Seq (
    "ch.qos.logback" %  "logback-classic" % "1.1.7"
  , "commons-lang" % "commons-lang" % "2.6"
  , "com.typesafe" % "config" % "1.3.0"
  , "org.apache.spark" %% "spark-core" % "2.2.0"
)


// ?! iss: eval
//lazy val root = (project in file(".")).enablePlugins(PlayScala)


// Purpose : 
// --------------------------------------------------------
// the sbt build filee for the aspark-starter project

// --------------------------------------------------------
// eof file: src/scala/aspark-starter/build.sbt
