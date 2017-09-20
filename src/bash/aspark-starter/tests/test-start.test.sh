# src/bash/aspark-starter/funcs/test-start.test.sh

# v1.0.9
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/test-start.test.txt
# ---------------------------------------------------------
doTestTestStart(){

	doLog "DEBUG START doTestTestStart"
	
	
	sleep "$sleep_interval"
	# Action !!!
   bash src/bash/aspark-starter/aspark-starter.sh -a test-start

	doLog "DEBUG STOP  doTestTestStart"
}
# eof func doTestTestStart


# eof file: src/bash/aspark-starter/funcs/test-start.test.sh
