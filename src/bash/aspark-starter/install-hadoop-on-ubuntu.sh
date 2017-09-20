#!/bin/bash
# file: src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
# caveat package names are for Ubuntu !!!
set -eu -o pipefail # fail on error , debug all lines

# run as root
[ "$USER" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2


pckgs_dir=/var/pckgs/apache
sudo mkdir -p "$pckgs_dir" ; cd "$pckgs_dir"

install_dir=/usr/local/hadoop
sudo mkdir -p "$install_dir" ; cd "$install_dir"

# download the hadoop package
curl -O 'http://mirror.netinch.com/pub/apache/hadoop/common/hadoop-2.7.4/hadoop-2.7.4.tar.gz'

# uncompress it
gzip -dc hadoop-2.7.4.tar.gz | tar -C "$install_dir" -xvf -

# go back to the starting dir
cd -

echo "created the following dir" 
find $install_dir/hadoop-2.7.4/ -type d -maxdepth 2

which hadoop
# eof file src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
