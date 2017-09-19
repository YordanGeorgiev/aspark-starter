# src/bash/aspark-starter/funcs/run-local-app.func.sh

# v0.0.5
# ---------------------------------------------------------
# cat doc/txt/aspark-starter/funcs/run-local-app.func.txt
# ---------------------------------------------------------
doRunLocalApp(){

	doLog "DEBUG START doRunLocalApp"
	sleep "$sleep_interval"
	cd "$product_instance_dir"'/src/scala/'"$run_unit"

   # jar_file="$jar_file/src/scala/aspark-starter/target/universal/stage/lib/com.csitea.aspark-starter-0.0.6.jar"
	jar_file="$product_instance_dir/src/scala/$run_unit/target/universal"
	jar_file="$jar_file/stage/lib/com.csitea.$run_unit"'-'"$product_version.jar"

   doLog "INFO using the following jar_file:"
   doLog "INFO $jar_file"

	test -f "$jar_file" && doLog "INFO using the following jar_file: $jar_file"
   # force each time usage of the newest version
	test -f "$jar_file" && rm -fv "$jar_file"
	test -f "$jar_file" || sbt stage

   # src:
   # https://spark.apache.org/docs/latest/submitting-applications.html#advanced-dependency-management
	jars_dir="$product_instance_dir/src/scala/aspark-starter/target/universal/stage/lib"
   # the jars_list is a comma separated list of all the jars
   jars_list=$(echo "$jars_dir"/*.jar|perl -ne 's/\s+/,/g;chop;print')

   doLog "INFO using the following jars_list"
   doLog "INFO $jars_list"
	
   # Run application locally on all the cores
	# src: https://spark.apache.org/docs/latest/submitting-applications.html
	$SPARK_HOME/bin/spark-submit \
		--class app.Main \
		--master 'local[*]' \
		--deploy-mode 'client' \
      --driver-class-path "$jars_dir/org.postgresql.postgresql-42.1.1.jar" \
		--jars "$jars_list" \
		"$jar_file" \
      $scala_actions

	cd -
	doLog "DEBUG STOP  doRunLocalApp"
}
# eof func doRunLocalApp


# eof file: src/bash/aspark-starter/funcs/run-local-app.func.sh
