# src/bash/aspark-starter/funcs/xls-to-db.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestXlsToDb comments ...
# ---------------------------------------------------------
doTestXlsToDb(){

	doLog "DEBUG START doTestXlsToDb"
	
	cat doc/txt/aspark-starter/tests/xls-to-db.test.txt
	
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!
   src/bash/aspark-starter/aspark-starter.sh -a xls-to-db
   exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog "DEBUG STOP  doTestXlsToDb"
}
# eof func doTestXlsToDb


# eof file: src/bash/aspark-starter/funcs/xls-to-db.test.sh
