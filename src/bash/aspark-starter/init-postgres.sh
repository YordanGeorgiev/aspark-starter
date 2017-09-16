#!/bin/bash

# run as root
[ "$USER" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2
sudo passwd postgres

echo start the postgres 
sudo /etc/init.d/postgresql start


sudo su - postgres -c "psql <<__END__

SELECT 'crate the same user' ; 
   CREATE USER $USER ;
   ALTER USER $USER CREATEDB;

SELECT 'grant him the priviledges' ; 
   grant all privileges on database postgres to $USER ;
   alter user postgres password 'secret';

SELECT 'AND VERIFY' ; 
   select * from information_schema.role_table_grants 
   where grantee='""$USER""' ;

SELECT 'INSTALL EXTENSIONS' ; 
   CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";
   CREATE EXTENSION IF NOT EXISTS \"pgcrypto\";
   CREATE EXTENSION IF NOT EXISTS \"dblink\";

SELECT 'on which port the postgres server is listening' ;
SELECT * FROM pg_settings WHERE name = 'port';
__END__
"

sudo /etc/init.d/postgresql status
sudo netstat -tulntp | grep -i postgres


# eof file: src/bash/aspark-starter/init-postgres.sh
