# src/bash/futu-py-conffi/funcs/run-python.func.sh

# 
# ---------------------------------------------------------
# cat doc/txt/futu-py-conffi/funcs/run-python.func.txt
# ---------------------------------------------------------
doRunPython(){

	doLog "DEBUG START doRunPython"
	
   test $(python3 -V | grep -c 'Python 3.') || export exit_code=1
   test $(python3 -V | grep -c 'Python 3.') || doExit 1 "
      you should first run the following cmd:
   source $product_instance_dir/lib/bash/funcs/setup-python-virtual-environment.sh
   "
	test -z "$sleep_interval" || sleep "$sleep_interval"

   args=$@
	# Action !!! with all warnings 
   set -x
	$product_instance_dir/lib/python/bin/python -W all src/python/aspark_handler/aspark_handler.py $args
	
	doLog "DEBUG STOP  doRunPython"
}
# eof func doRunPython


# eof file: src/bash/futu-py-conffi/funcs/run-python.func.sh
