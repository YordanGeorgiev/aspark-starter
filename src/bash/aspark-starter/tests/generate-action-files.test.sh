# src/bash/aspark-starter/funcs/generate-action-files.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestGenerateActionFiles comments ...
# ---------------------------------------------------------
doTestGenerateActionFiles(){

	doLog "DEBUG START doTestGenerateActionFiles"
	
	# Action !!!	
	bash src/bash/aspark-starter/aspark-starter.sh -a generate-action-files

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return


	doLog "DEBUG STOP  doTestGenerateActionFiles"
	
	sleep $sleep_interval
   printf "\033[2J";printf "\033[0;0H"

}
# eof func doTestGenerateActionFiles


# eof file: src/bash/aspark-starter/funcs/generate-action-files.test.sh
