# src/bash/aspark-starter/funcs/xls-to-db.func.sh

# v0.1.8
# ---------------------------------------------------------
# load xls to db
# ---------------------------------------------------------
doXlsToDb(){

	doLog "DEBUG START doXlsToDb"
	
	# cat doc/txt/aspark-starter/funcs/xls-to-db.func.txt
   export aspark_starter_project	
	export db_name
	export db_host
   export db_port
   export db_user
   export db_user_pw

	sleep "$sleep_interval"
   test -z ${issues_order_by_attribute+x} && export issues_order_by_attribute='category'
   test -z ${period+x} && export period='daily'
   test -z ${tables+x} && export tables='daily_issues'

   # find out the latest xls file from the project daily dir
   # pass it to the xls-to-rdbms tool as the input xls file
   
   test -z ${xls_file+x} && \
      export xls_file=$(find ${proj_daily_data_root_dir} -name '*.xlsx'| grep '.all.'| sort -rn|head -n 1)
   test -z ${xls_file+x} && \
      export xls_file=$(find $proj_daily_data_root_dir -name '*.xlsx'| grep $period| sort -rn|head -n 1)

   doLog "\${proj_daily_data_root_dir+}: ${proj_daily_data_root_dir+}"
   doLog "INFO \$xls_file: $xls_file"
   
   # Action !!!
   perl src/perl/aspark_starter/script/aspark_starter.pl \
      --do xls-to-db --xls-file $xls_file --tables $tables
   exit_code=$?
   
#   psql -d "$db_name" -c '
#   SELECT category , substring ( description from 0 for 40 ) as descrption , start_time , stop_time
#   FROM '"$tables"'_issues order by '"$issues_order_by_attribute"'
#   ;';
   
   doLog "INFO doRunASparkStarter exit_code $exit_code"
   test $exit_code -ne 0 && doExit $exit_code "failed to run aspark_starter.pl"  
  
	doLog "DEBUG STOP  doXlsToDb"
}
# eof func doXlsToDb


# eof file: src/bash/aspark-starter/funcs/xls-to-db.func.sh
