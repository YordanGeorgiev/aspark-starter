# src/bash/aspark-starter/funcs/run-perl-tests.test.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doTestRunPerlTests comments ...
# ---------------------------------------------------------
doTestRunPerlTests(){

	doLog "DEBUG START doTestRunPerlTests"
	
	cat doc/txt/aspark-starter/tests/perl/run-perl-tests.test.txt
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	
	bash src/bash/aspark-starter/aspark-starter.sh -a run-perl-tests
	
	doLog "DEBUG STOP  doTestRunPerlTests"
}
# eof func doTestRunPerlTests


# eof file: src/bash/aspark-starter/funcs/run-perl-tests.test.sh
