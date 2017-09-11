# src/bash/aspark-starter/funcs/sbt-compile-verbose.test.sh

# v0.0.3
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/sbt-compile-verbose.test.txt
# ---------------------------------------------------------
doTestSbtCompileVerbose(){

	doLog "DEBUG START doTestSbtCompileVerbose"
	
	sleep "$sleep_interval"
	# Action !!!
   bash src/bash/aspark-starter/aspark-starter.sh   -a sbt-compile-verbose
	doLog "DEBUG STOP  doTestSbtCompileVerbose"
}
# eof func doTestSbtCompileVerbose


# eof file: src/bash/aspark-starter/funcs/sbt-compile-verbose.test.sh
