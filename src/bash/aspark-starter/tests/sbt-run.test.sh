# src/bash/aspark-starter/funcs/sbt-run.test.sh

# v0.0.2
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/sbt-run.test.txt
# ---------------------------------------------------------
doTestSbtRun(){

	doLog "DEBUG START doTestSbtRun"
	
	
	sleep "$sleep_interval"
	# Action !!!
   bash src/bash/aspark-starter/aspark-starter.sh -a sbt-run

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return


	doLog "DEBUG STOP  doTestSbtRun"
}
# eof func doTestSbtRun

# eof file: src/bash/aspark-starter/funcs/sbt-run.test.sh
