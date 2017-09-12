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

	doLog "DEBUG STOP  doTestSbtRun"
}
# eof func doTestSbtRun

# eof file: src/bash/aspark-starter/funcs/sbt-run.test.sh
