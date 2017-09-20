#!/bin/bash
# Purpose: 
# to setup the python virtual environment and 
# install in it the reqired python3 modules

if test -n "$BASH" ; then run_unit=$BASH_SOURCE
   elif test -n "$TMOUT"; then run_unit=${.sh.file}
   elif test -n "$ZSH_NAME" ; then run_unit=${(%):-%x}
   elif test ${0##*/} = dash; then x=$(lsof -p $$ -Fn0 | tail -1); run_unit=${x#n}
   else run_unit=$0
fi

run_unit_bash_dir=$(dirname $run_unit)
cd $run_unit_bash_dir ; for i in {1..3} ; do cd .. ; done ;
export product_instance_dir=`pwd`; pushd `pwd`

# run as root
[ "$USER" = "root" ] || echo exec sudo "$product_instance_dir/$run_unit" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2



flg_found_python=$(which python3|wc -l)
flg_found_pip=$(which pip3|wc -l)

test $flg_found_python -eq 1 || echo " install python3 !!!"
test $flg_found_python -eq 1 || exit 1

test $flg_found_pip -eq 1 || echo " install pip3 !!!"
test $flg_found_pip -eq 1 || exit 1

## setup the proper python aliases
alias python=$(which python3)
alias pip=$(which pip3)

echo "using the following python $(which python3)"
echo "using the following pip $(which pip3)"

# setup the python virtual env 
python3 -m venv "$product_instance_dir/lib/python"

#
# set -x
"$product_instance_dir"'/lib/python/bin/pip' install -r \
   "$product_instance_dir"'/cnf/python/python-virtual-env-requirements.lst'

# and activate it 
source "$product_instance_dir"'/lib/python/bin/activate'

alias python=$product_instance_dir/lib/python/bin/python
alias pip=$product_instance_dir/lib/python/bin/pip

