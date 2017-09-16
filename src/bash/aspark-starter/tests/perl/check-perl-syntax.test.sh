# src/bash/aspark-starter/funcs/check-perl-syntax.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestCheckPerlSyntax comments ...
# ---------------------------------------------------------
doTestCheckPerlSyntax(){

	doLog "DEBUG START doTestCheckPerlSyntax"
	
	cat doc/txt/aspark-starter/tests/perl/check-perl-syntax.test.txt
	sleep "$sleep_interval"

	bash src/bash/aspark-starter/aspark-starter.sh -a check-perl-syntax
   exit_code=$?
	doLog " check-perl-syntax-1 exit_code: $exit_code "

   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog "DEBUG STOP  doTestCheckPerlSyntax"
}
# eof func doTestCheckPerlSyntax


# eof file: src/bash/aspark-starter/funcs/check-perl-syntax.test.sh
