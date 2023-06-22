#!/bin/bash

if [ ! -f /conf ]
then
        mkdir -p /var/run/mysqld
        chown -R mysql:mysql /var/run/mysqld
        chmod 777 -R /var/run/mysqld
        chown -R mysql:mysql /var/lib/mysql
        service mysql restart 
        mysql -u root -p${DB_ROOT}
        cat << EOF > /tmp/dbscript.sql
USE mysql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
EOF
        mysql -uroot -p${DB_ROOT} < /tmp/dbscript.sql

        mysqladmin -uroot -p$DB_ROOT shutdown
        touch /conf

else
        echo "db already conf"
fi
echo "mariadb ready" 
exec mysqld
