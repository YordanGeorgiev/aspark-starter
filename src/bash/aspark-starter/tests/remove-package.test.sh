# src/bash/aspark-starter/funcs/remove-package.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestRemovePackage comments ...
# ---------------------------------------------------------
doTestRemovePackage(){

	doLog "DEBUG START doTestRemovePackage"
	
	cat doc/txt/aspark-starter/tmpl/remove-package.test.txt

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	# add your action implementation code here ... 

	doLog "DEBUG STOP  doTestRemovePackage"
}
# eof func doTestRemovePackage


# eof file: src/bash/aspark-starter/funcs/remove-package.test.sh
