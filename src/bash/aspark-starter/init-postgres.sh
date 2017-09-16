#!/bin/bash

# run as root
[ "$USER" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2
sudo passwd postgres

echo start the postgres 
sudo /etc/init.d/postgresql start

echo Create the pgsql user
sudo su - postgres  -c "psql -c 'CREATE USER '$USER' ;'"

echo grant him the priviledges
sudo su - postgres  -c \
"psql -c 'grant all privileges on database postgres to '$USER' ;'"
sudo su - postgres  -c \
"psql -c 'ALTER USER '$USER' CREATEDB;'"
sudo su - postgres  -c \
'psql -c "select * from information_schema.role_table_grants 
where grantee='"'"$USER"'"';"'

echo install extensions
sudo su - postgres  -c \
"psql template1 -c 'CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";'"
sudo su - postgres  -c \
"psql template1 -c 'CREATE EXTENSION IF NOT EXISTS \"pgcrypto\";'"
sudo su - postgres  -c \
"psql template1 -c 'CREATE EXTENSION IF NOT EXISTS \"dblink\";'"

sudo /etc/init.d/postgresql status
sudo netstat -tulntp | grep -i postgres

# issues:
# chk: https://stackoverflow.com/a/32409065/65706

# eof file: src/bash/aspark-starter/init-postgres.sh
