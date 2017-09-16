#!/bin/bash
# file: src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
# caveat package names are for Ubuntu !!!
set -eu -o pipefail # fail on error , debug all lines

# run as root
[ "$USER" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2


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
done < <(cat << "EOF"
   perl
   zip unzip
   exuberant-ctags
   mutt
   libxml-atom-perl
   postgresql-9.6
   libdbd-pgsql
   curl
   wget
   libwww-curl-perl
EOF
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
done < <(cat << "EOF"
   tig
EOF
)

# eof file src/bash/aspark-starter/install-prerequisites-for-aspark-starter.sh
