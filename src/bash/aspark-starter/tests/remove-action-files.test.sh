# src/bash/aspark-starter/funcs/remove-action-files.test.sh

# v1.1.2
# ---------------------------------------------------------
# adds first an action to remove 
# generates all the aciton files (( it will add this new ) 
# action to remove
# and tests the actual removal at the end 
# ---------------------------------------------------------
doTestRemoveActionFiles(){

	doLog "DEBUG START doTestRemoveActionFiles"

	doSpecRemoveActionFiles
	sleep "$sleep_interval"
	printf "\033[2J";printf "\033[0;0H"

	doHelpRemoveActionFiles
	sleep "$sleep_interval"
	printf "\033[2J";printf "\033[0;0H"
	
	cat doc/txt/aspark-starter/tests/remove-action-files.test.txt
	sleep "$sleep_interval"
	printf "\033[2J";printf "\033[0;0H"
	
	# add an action to remove
	found=$(grep -c action-to-remove src/bash/aspark-starter/tests/rem-aspark-starter-actions.lst)
	test $found -eq 0 && \
	echo action-to-remove >> src/bash/aspark-starter/tests/rem-aspark-starter-actions.lst
	found=0
	
	found=$(grep -c action-to-remove src/bash/aspark-starter/tests/all-aspark-starter-tests.lst)
	test $found -eq 0 && \
		echo action-to-remove >> src/bash/aspark-starter/tests/all-aspark-starter-tests.lst

	# now generate the code files for this action to remove
	bash src/bash/aspark-starter/aspark-starter.sh -a generate-action-files		
	sleep "$sleep_interval"
	printf "\033[2J";printf "\033[0;0H"

	# and test the actual removal of the action 	
	bash src/bash/aspark-starter/aspark-starter.sh -a remove-action-files		
	doLog "DEBUG STOP  doTestRemoveActionFiles"

	sleep "$sleep_interval"
	printf "\033[2J";printf "\033[0;0H"
}
# eof func doTestRemoveActionFiles


# eof file: src/bash/aspark-starter/funcs/remove-action-files.test.sh
