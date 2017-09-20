# src/bash/futu-py-conffi/funcs/check-python-syntax.func.sh

# ---------------------------------------------------------
# check the python synax for all the *.py files under the 
# ---------------------------------------------------------
doCheckPythonSyntax(){
# set -x

	doLog "DEBUG START doCheckPythonSyntax"
	
	test -z "$sleep_interval" || sleep "$sleep_interval"
	cd $product_instance_dir/src/python
	# python3 -m compileall "$product_instance_dir/src/python"

	# foreach *.py file ...
	while read -r f ; do \

		py_name_ext=$(basename $f)
		py_name=${py_name_ext%.*}		

		doLog "INFO runing python3 -c \"import $py_name\""
		# doLog "python3 -m py_compile $f"

		python3 -c "import $py_name"
		# python3 -m py_compile "$f"
		test $! -ne 0 && sleep 5

	done < <(find "$product_instance_dir/src/python/aspark_handler" -maxdepth 1 -type f -name "*.py")

	doLog "DEBUG STOP  doCheckPythonSyntax"
}
# eof func doCheckPythonSyntax


# eof file: src/bash/futu-py-conffi/funcs/check-python-syntax.func.sh
