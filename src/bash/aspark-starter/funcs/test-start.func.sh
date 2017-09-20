# src/bash/aspark-starter/funcs/test-start.func.sh

# 
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/funcs/test-start.func.txt
# ---------------------------------------------------------
doTestStart(){
	doLog "DEBUG START doTestStart"
	
	sleep "$sleep_interval"

   doLog "INFO load the environment"
   set +u 

   source "$product_instance_dir"'/lib/python/bin/activate'
   doLog "INFO test the starting of instances"
   python -W all src/python/aspark_handler/aspark_handler.py --start dockers
   exit_code=$?
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

	sleep "$sleep_interval"
   doLog "INFO test the starting of elbs"
   python -W all src/python/aspark_handler/aspark_handler.py --start instances
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

   doLog "INFO test the starting of non-existing resources"
   python -W all src/python/aspark_handler/aspark_handler.py --start non-existing-resources
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

	sleep "$sleep_interval"
	doLog "DEBUG STOP  doTestStart"
}
# eof func doTestStart


# eof file: src/bash/aspark-starter/funcs/test-start.func.sh
