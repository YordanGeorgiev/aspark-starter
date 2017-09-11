#!/bin/bash 
#file: src/bash/aspark-starter/funcs/scala/sbt-build.func.sh

umask 022    ;


#v0.0.2
#------------------------------------------------------------------------------
# do sbt compile
#------------------------------------------------------------------------------
doSbtCompile(){

	test -z "$run_unit" && run_unit=$wrap_name
	# and clear the screen
	printf "\033[2J";printf "\033[0;0H"
	doLog "INFO START ::: doSbtCompile"
	cd $product_instance_dir/src/scala/$run_unit

   # sbt clean
   # src: http://www.scala-sbt.org/sbt-native-packager/formats/universal.html
   # sbt universal:packageBin
	sbt compile
	
   ret=$?
	
   cd $product_instance_dir
	test $ret -ne 0 && sleep 1 && doExit 4 "Scala syntax error" ; 
	test $ret -eq 0 && doLog "INFO STOP  ::: doSbtCompile. No Errors !!!"
}
#eof func doSbtCompile 


#
#------------------------------------------------------------------------------
#
#eof file: src/bash/aspark-starter/aspark-starter-incl-perl.sh
