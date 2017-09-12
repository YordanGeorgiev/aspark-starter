# src/bash/aspark-starter/funcs/create-full-7z-package.test.sh

# v1.1.0
# ---------------------------------------------------------
# todo: add doTestCreateFull7zPackage comments ...
# ---------------------------------------------------------
doTestCreateFull7zPackage(){

	doLog "DEBUG START doTestCreateFull7zPackage"
	
	cat doc/txt/aspark-starter/tests/pckg/create-full-7z-package.test.txt
	
	doSpecCreateFull7zPackage
	doHelpCreateFull7zPackage

	# add your action implementation code here ... 
	bash src/bash/aspark-starter/aspark-starter.sh -a create-full-7z-package

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return


	doLog "DEBUG STOP  doTestCreateFull7zPackage"
}
# eof func doTestCreateFull7zPackage


# eof file: src/bash/aspark-starter/funcs/create-full-7z-package.test.sh
