#!/bin/bash
#
#--ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';

#if [ ! -f /mariadbcheck ]

if (( $(ps -ef | grep -v grep | grep mysql| wc -l) < 1 ))
then
        mkdir -p /var/run/mysqld
        chown -R mysql:mysql /var/run/mysqld
        chmod 777 -R /var/run/mysqld
        chown -R mysql:mysql /var/lib/mysql
        echo "1"
        service mysql restart 
        mysql -u root -p${DB_ROOT}
        echo "Password : ${DB_ROOT}"
        #mysqladmin -u root password ${DB_ROOT}
        echo "2"
        echo ""
        echo "mysqld &"
        #mysqld &
        #mysql $DB_NAME 
        sleep 5
        
        echo "Database ready" 

        #mysqld -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT';"
	#mysqld -uroot -p$DB_ROOT -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	#mysqld -uroot -p$DB_ROOT -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
	#mysqld -uroot -p$DB_ROOT -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	#mysqld -uroot -p$DB_ROOT -e "FLUSH PRIVILEGES;"

        echo "Running dbscript"
        echo "${DB_ROOT}"
        cat << EOF > /tmp/dbscript.sql
USE mysql
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
\! echo "4 $DB_NAME";
SELECT user FROM user
EOF
        mysql -uroot -p${DB_ROOT} < /tmp/dbscript.sql
        #mysql -uroot -p${DB_ROOT} < /tmp/dbscript
        #mysql -uroot --skip-password < /tmp/dbscript

        echo "Done"
        mysqladmin -uroot -p$DB_ROOT shutdown
        #while :
        #do
        #        sleep 10
        #        mysqladmin -u root -p${DB_ROOT} status
        #done

else
        echo "MariaDB already conf"
fi

exec mysqld
