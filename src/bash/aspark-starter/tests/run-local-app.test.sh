# src/bash/aspark-starter/funcs/run-local-app.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestRunLocalApp comments ...
# ---------------------------------------------------------
doTestRunLocalApp(){

	doLog "DEBUG START doTestRunLocalApp"
	
	cat doc/txt/aspark-starter/tests/run-local-app.test.txt
	
	sleep "$sleep_interval"
	# Action !!!
   
   doLog "INFO testing the read-and-modify-posix-files action"
   bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app -s read-and-modify-posix-files
   sleep 1

   doLog "INFO testing the read-rdbms-to-posix-files action"
   bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app -s read-rdbms-to-posix-files
   sleep 1

   doLog "INFO testing the read-rdbms-to-hdfs-files action"
   bash src/bash/aspark-starter/aspark-starter.sh -a run-local-app -s read-rdbms-to-hdfs-files

   doLog "INFO done!!!"

	doLog "DEBUG STOP  doTestRunLocalApp"
}
# eof func doTestRunLocalApp


# eof file: src/bash/aspark-starter/funcs/run-local-app.test.sh
