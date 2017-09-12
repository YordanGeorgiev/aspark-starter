# src/bash/aspark-starter/funcs/create-ctags.test.sh

# v1.0.9
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/tests/create-ctags.test.txt
# ---------------------------------------------------------
doTestCreateCtags(){

	doLog "DEBUG START doTestCreateCtags"

	bash src/bash/aspark-starter/aspark-starter.sh -a create-ctags	

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

	doLog "DEBUG STOP  doTestCreateCtags"
}
# eof func doTestCreateCtags


# eof file: src/bash/aspark-starter/funcs/create-ctags.test.sh
