# src/bash/aspark-starter/funcs/clone-to-app.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestCloneToApp comments ...
# ---------------------------------------------------------
doTestCloneToApp(){

	doLog "DEBUG START doTestCloneToApp"
	
	# add your action implementation code here ... 
   bash src/bash/aspark-starter/aspark-starter.sh -a to-app=foobar

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return


	doLog "DEBUG STOP  doTestCloneToApp"
}
# eof func doTestCloneToApp


# eof file: src/bash/aspark-starter/funcs/clone-to-app.test.sh
