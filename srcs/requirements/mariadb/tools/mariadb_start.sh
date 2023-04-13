#!/bin/bash

if [ ! -f /conf ]
then
        mkdir -p /run/mysqld
        chown -R mysql:mysql /run/mysqld
        ls /var/run/mysqld
        echo ""
       # mysqladmin -uroot -p ${DB_PASS}
        echo "mysqld &"
        mysqld &
        while !(mysqladmin ping > /dev/null)
	do
		echo "Waiting for database to be ready..." 
	    sleep 5
	done

        mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"
	mysql -uroot -p$DB_ROOT -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -uroot -p$DB_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	mysql -uroot -p$DB_ROOT -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mysql -uroot -p$DB_ROOT -e "FLUSH PRIVILEGES;"


        touch /conf
else
        echo "MariaDB already conf"
fi

