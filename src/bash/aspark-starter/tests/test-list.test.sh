# src/bash/aspark-starter/funcs/test-list.test.sh

# v1.0.9
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/test-list.test.txt
# ---------------------------------------------------------
doTestTestList(){

	doLog "DEBUG START doTestTestList"
	
	
	sleep "$sleep_interval"
	# Action !!!
   bash src/bash/aspark-starter/aspark-starter.sh -a test-list
   export exit_code=$?

	doLog "DEBUG STOP  doTestTestList"
}
# eof func doTestTestList


# eof file: src/bash/aspark-starter/funcs/test-list.test.sh
