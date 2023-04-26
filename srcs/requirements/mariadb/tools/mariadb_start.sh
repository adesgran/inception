#!/bin/bash

#if [ ! -f /mariadbcheck ]

if (( $(ps -ef | grep -v grep | grep mysql| wc -l) < 1 ))
then
        touch /mariadbcheck
        mkdir -p /var/run/mysqld
        chown -R mysql /var/run/mysqld
        chown -R mysql /var/lib/mysql
        service mysql restart
        echo "1"
        #mysql -uroot -p${DB_ROOT}
        echo "Password : ${DB_ROOT}"
        mysqladmin -u root password ${DB_ROOT}
        echo "2"
        echo ""
        echo "mysqld &"
        #mysqld &
        #mysql wordpress
        
        echo "Database ready" 

        #mysqld -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"
	#mysqld -uroot -p$DB_ROOT -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	#mysqld -uroot -p$DB_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	#mysqld -uroot -p$DB_ROOT -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	#mysqld -uroot -p$DB_ROOT -e "FLUSH PRIVILEGES;"

        echo "Running dbscript"
        mysql --user=root  < /tmp/dbscript
        echo "Done"
        while :
        do
                sleep 10
                echo "sleep"
        done

else
        echo "MariaDB already conf"
fi

