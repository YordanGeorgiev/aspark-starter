# src/bash/aspark-starter/funcs/test-list.func.sh

# 
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/funcs/test-list.func.txt
# ---------------------------------------------------------
doTestList(){
	doLog "DEBUG START doTestList"
	
	sleep "$sleep_interval"

   doLog "INFO load the environment"
   set +u 
   # source lib/bash/funcs/setup-python-env.src.sh

   doLog "INFO test the listing of instances"
   python -W all src/python/aspark_handler/aspark_handler.py --list dockers
   export exit_code=$?
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return
   
	sleep "$sleep_interval"
   doLog "INFO test the listing of elbs"
   python -W all src/python/aspark_handler/aspark_handler.py --list instances
   export exit_code=$?
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return
	
   doLog "INFO test the listing of non-existing resources"
   python -W all src/python/aspark_handler/aspark_handler.py --list non-existing-resources
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

	sleep "$sleep_interval"
	doLog "DEBUG STOP  doTestList"
}
# eof func doTestList


# eof file: src/bash/aspark-starter/funcs/test-list.func.sh
