# src/bash/aspark-starter/funcs/sbt-compile.test.sh

# v1.0.9
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/sbt-compile.test.txt
# ---------------------------------------------------------
doTestSbtCompile(){

	doLog "DEBUG START doTestSbtCompile"
	
	sleep "$sleep_interval"
   src/bash/aspark-starter/aspark-starter.sh -a sbt-compile

   export exit_code=$?
	sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog "DEBUG STOP  doTestSbtCompile"
}
# eof func doTestSbtCompile


# eof file: src/bash/aspark-starter/funcs/sbt-compile.test.sh
