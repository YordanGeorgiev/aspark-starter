#!/bin/bash 

#v1.0.6
#------------------------------------------------------------------------------
# creates the relative package as component of larger product platform
#------------------------------------------------------------------------------
doTestCreateRelative7zPackage(){
	doLog " INFO START : create-relative-7z-package.test"
	
	cat src/bash/aspark-starter/tests/create-relative-7z-package.test.sh

	bash src/bash/aspark-starter/aspark-starter.sh -a create-relative-7z-package	

   export exit_code=$?
   sleep "$sleep_interval"
   test $exit_code -ne 0 && return

	doLog " INFO STOP  : create-relative-7z-package.test"
	
	
}
#eof test doCreaterelative7zPackage

