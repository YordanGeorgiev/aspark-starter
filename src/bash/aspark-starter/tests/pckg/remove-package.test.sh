#!/bin/bash


#v0.2.0
#------------------------------------------------------------------------------
# removes all the files from a deployed aspark-starter instance
#------------------------------------------------------------------------------
doTestRemovePackage(){

	doRemovePackageFiles
	
   #remove the dirs as well
   for dir in `cat "$include_file"`; do (
       dir="$product_instance_dir/$dir"
       test -d "$dir" && cmd="rm -fRv $dir" && doRunCmdAndLog "$cmd"
   );
   done

 	cmd="rm -fv $include_file" && \
 	doRunCmdAndLog "$cmd"
	echo "rm -fvr $product_instance_dir">>"$product_dir/remove-""$product_instance_env_name".sh
	echo "rm -fv $product_dir/remove-""$product_instance_env_name".sh>>"$product_dir/remove-""$product_instance_env_name".sh
	nohup bash "$product_dir/remove-""$product_instance_env_name".sh &
}
#eof test doRemovePackage
