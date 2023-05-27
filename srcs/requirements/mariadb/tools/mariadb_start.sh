#!/bin/bash

if (( $(ps -ef | grep -v grep | grep mysql| wc -l) < 1 ))
then
        mkdir -p /var/run/mysqld
        chown -R mysql:mysql /var/run/mysqld
        chmod 777 -R /var/run/mysqld
        chown -R mysql:mysql /var/lib/mysql
        service mysql restart 
        mysql -u root -p${DB_ROOT}
        echo "Running dbscript"
        cat << EOF > /tmp/dbscript.sql
USE mysql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
SELECT user FROM user
EOF
        mysql -uroot -p${DB_ROOT} < /tmp/dbscript.sql

        echo "Done"
        mysqladmin -uroot -p$DB_ROOT shutdown
        echo "Database ready" 

else
        echo "MariaDB already conf"
fi

exec mysqld
