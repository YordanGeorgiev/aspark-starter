# src/bash/aspark-starter/funcs/print-usage.help.sh

# v1.0.9
# ---------------------------------------------------------
# todo: add doHelpPrintUsage comments ...
# ---------------------------------------------------------
doHelpPrintUsage(){

	doLog "DEBUG START doHelpPrintUsage"
	
	cat doc/txt/aspark-starter/helps/print-usage.help.txt
	
	sleep "$sleep_interval"
	# add your action implementation code here ... 
	# Action !!!

	doLog "DEBUG STOP  doHelpPrintUsage"
}
# eof func doHelpPrintUsage


# eof file: src/bash/aspark-starter/funcs/print-usage.help.sh
