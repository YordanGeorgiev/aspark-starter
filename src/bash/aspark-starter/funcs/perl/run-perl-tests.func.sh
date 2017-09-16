# src/bash/aspark-starter/funcs/run-perl-tests.func.sh

# v1.1.0
# ---------------------------------------------------------
# todo: add doRunPerlTests comments ...
# ---------------------------------------------------------
doRunPerlTests(){
	
	doLog "DEBUG START : doRunPerlTests"

	doLog "INFO Component testing Initiator.pm with TestInitiator "
	perl src/perl/aspark_starter/t/TestInitiator.pm
	test -z "$sleep_iterval" || sleep $sleep_iterval
	
	doLog "INFO Component testing Logger.pm with TestLogger "
	perl src/perl/aspark_starter/t/TestLogger.pl
	test -z "$sleep_iterval" || sleep $sleep_iterval
	
	doLog "INFO Component testing Logger.pm with TestLogger "
	perl src/perl/aspark_starter/t/TestCtrlFileToDb.pm
	test -z "$sleep_iterval" || sleep $sleep_iterval
	doLog "INFO STOP  : doRunPerlTests"
}
# eof func doRunPerlTests


# eof file: src/bash/aspark-starter/funcs/run-perl-tests.func.sh
