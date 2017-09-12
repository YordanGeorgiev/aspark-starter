# src/bash/aspark-starter/funcs/sbt-stage.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestSbtStage comments ...
# ---------------------------------------------------------
doTestSbtStage(){

	doLog "DEBUG START doTestSbtStage"
	
	cat doc/txt/aspark-starter/tests/sbt-stage.test.txt
	
	sleep "$sleep_interval"
   src/bash/aspark-starter/aspark-starter.sh -a sbt-stage

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog "DEBUG STOP  doTestSbtStage"
}
# eof func doTestSbtStage


# eof file: src/bash/aspark-starter/funcs/sbt-stage.test.sh
