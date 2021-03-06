# src/bash/aspark-starter/funcs/gmail-package.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestGmailPackage comments ...
# ---------------------------------------------------------
doTestGmailPackage(){

	doLog "DEBUG START doTestGmailPackage"
	
   cat doc/txt/aspark-starter/tests/pckg/gmail-package.test.txt
	sleep "$sleep_interval"

	bash src/bash/aspark-starter/aspark-starter.sh -a create-full-package -a gmail-package

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

   printf "\033[2J";printf "\033[0;0H"

	doLog "DEBUG STOP  doTestGmailPackage"
}
# eof func doTestGmailPackage


# eof file: src/bash/aspark-starter/funcs/gmail-package.test.sh
