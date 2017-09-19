// file: src/scala/aspark-starter/build.sbt

// the owner org
organization := "com.csitea"

// the name of this proj
name := "aspark-starter" 

// the version of this proj
version := "0.1.1"

scalaVersion := "2.11.8"

val sparkVersion = "2.2.0"

// src: http://www.scala-sbt.org/sbt-native-packager/gettingstarted.html
enablePlugins(JavaAppPackaging)
// enablePlugins(UniversalPlugin)

// src: http://www.scala-sbt.org/0.13/docs/Resolvers.html
//resolvers += Resolver.url("main Maven repository", url("https://mvnrepository.com/artifact/com.typesafe/config"))
//resolvers += Resolver.url("Scalaz Bintray Repo", url("http://dl.bintray.com/scalaz/releases"))

resolvers += Resolver.url("Central Maven Repository", url("http://central.maven.org/maven2/"))
resolvers += "sonatype-releases" at "https://oss.sonatype.org/content/repositories/releases/"




libraryDependencies ++= Seq (
    "ch.qos.logback" % "logback-classic" % "1.2.3"
  , "com.typesafe" % "config" % "1.3.1"
  , "org.apache.spark" %% "spark-core" % sparkVersion
  , "org.apache.spark" %% "spark-sql" % sparkVersion
  , "org.postgresql" % "postgresql" % "42.1.1"
)

// ?! iss: eval
//lazy val root = (project in file(".")).enablePlugins(PlayScala)

// Purpose : 
// --------------------------------------------------------
// the sbt build filee for the aspark-starter project

// --------------------------------------------------------
// eof file: src/scala/aspark-starter/build.sbt
