#!/bin/bash 
#file: src/bash/aspark-starter/funcs/scala/sbt-build.func.sh

umask 022    ;

# print the commands
# set -x
# print each input line as well
# set -v
# exit the script if any statement returns a non-true return value. gotcha !!!
# set -e
trap 'doExit $LINENO $BASH_COMMAND; exit' SIGHUP SIGINT SIGQUIT



#v0.0.2
#------------------------------------------------------------------------------
# do sbt compile
#------------------------------------------------------------------------------
doSbtCompile(){

	test -z "$run_unit" && run_unit=$wrap_name
	# and clear the screen
	printf "\033[2J";printf "\033[0;0H"
	set +x	
	doLog "INFO START ::: doSbtCompile"
	cd $product_instance_dir/src/scala/$run_unit

   sbt clean
   # src: http://www.scala-sbt.org/sbt-native-packager/formats/universal.html
   # sbt universal:packageBin
	sbt compile
	#sbt compile
	ret=$?
	test $ret -ne 0 && sleep 1 && doExit 4 "Scala syntax error" ; 
	cd $product_instance_dir

	test $ret -eq 0 && doLog "INFO STOP  ::: doSbtCompile. No Errors !!!"
}
#eof func doSbtCompile 


#
# VersionHistory:
#------------------------------------------------------------------------------
# 1.0.0 -- 2016-09-11 11:58:34 -- ysg -- init
#
#eof file: src/bash/aspark-starter/aspark-starter-incl-perl.sh v1.0.0
