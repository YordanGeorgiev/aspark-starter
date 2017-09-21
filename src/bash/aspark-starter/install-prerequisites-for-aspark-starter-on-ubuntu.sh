#!/bin/bash
# file: src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
# caveat package names are for Ubuntu !!!
set -eu -o pipefail # fail on error , debug all lines

# run as root
[ "${USER:-}" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2

cp -v /etc/apt/sources.list /etc/apt/sources.list.`date "+%Y%m%d_%H%M%S"`.bak

# add the Ubuntu 17.04 repos
# adjust here the repos
cat << "EOF_APT" > /etc/apt/sources.list
deb http://security.ubuntu.com/ubuntu zesty-security main restricted
deb http://security.ubuntu.com/ubuntu zesty-security universe
deb http://security.ubuntu.com/ubuntu zesty-security multiverse
deb http://fi.archive.ubuntu.com/ubuntu zesty main
deb [arch=amd64] http://fi.archive.ubuntu.com/ubuntu zesty universe
deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
EOF_APT

set -e
 echo refresh
apt-get update

# for postgres
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

 echo installing the must-have pre-requisites
 while read -r p ; do 
    if [ "" == "`which $p`" ]; 
    then echo "$p Not Found"; 
       if [ -n "`which apt-get`" ]; 
       then apt-get install -y $p ; 
       elif [ -n "`which yum`" ]; 
       then yum -y install $p ; 
       fi ; 
    fi
 done < <(cat << "EOF_MUST_HAVES"
    curl
    wget
    zip
    unzip
    apt-transport-https
    openssh-server
    perl
    rsync
    exuberant-ctags
    mutt
    postgresql-9.6
    libpq-dev
    libdbd-pgsql
    libxml-libxml-perl
    libwww-curl-perl
    python3
    python3-pip
    python3-venv
EOF_MUST_HAVES
 )
 
 echo installing the nice-to-have pre-requisites
 echo you have 5 seconds to proceed ...
 echo or 
 echo hit Ctrl+C to quit
 echo -e "\n"
 sleep 6
 
 echo installing the nice to-have pre-requisites
 while read -r p ; do 
    if [ "" == "`which $p`" ]; 
    then echo "$p Not Found"; 
       if [ -n "`which apt-get`" ]; 
       then apt-get install -y $p ; 
       elif [ -n "`which yum`" ]; 
       then yum -y install $p ; 
       fi ; 
    fi
 done < <(cat << "EOF_NICE_TO_HAVES"
    tig
    pv
EOF_NICE_TO_HAVES
 )
 
# eof file src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
