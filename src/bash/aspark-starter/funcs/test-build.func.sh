# src/bash/aspark-starter/funcs/test-build.func.sh

# 
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/funcs/test-build.func.txt
# ---------------------------------------------------------
doTestBuild(){
	doLog "DEBUG START doTestBuild"
	
	sleep "$sleep_interval"

   doLog "INFO load the environment"
   set +u 

   source "$product_instance_dir"'/lib/python/bin/activate'
   doLog "INFO test the building of dockers"
   python -W all src/python/aspark_handler/aspark_handler.py --build dockers
   exit_code=$?
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

   exit 0

	sleep "$sleep_interval"
   doLog "INFO test the building of intances"
   python -W all src/python/aspark_handler/aspark_handler.py --build instances
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

   doLog "INFO test the building of non-existing resources"
   python -W all src/python/aspark_handler/aspark_handler.py --build non-existing-resources
   doLog "INFO stopped with the followign exit_code: $exit_code" 
   test $exit_code -ne 0 && return

	sleep "$sleep_interval"
	doLog "DEBUG STOP  doTestBuild"
}
# eof func doTestBuild


# eof file: src/bash/aspark-starter/funcs/test-build.func.sh
