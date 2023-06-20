#!/bin/bash
if [ ! -f /conf ]
then
        rm -f /var/www/wp-config.php

        echo "wp core download"
        wp core download --allow-root --path="/var/www/html/wordpress"

        sleep 10
        echo "wp config create"
        until wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="mariadb:3306" --dbcharset="utf8" --dbcollate="utf8_general_ci"
        do
                sleep 3
        done

        echo "wp core install"
        wp core install --allow-root --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD"\
                --admin_email="$ADMIN_MAIL" --url="${URL}/" --title="Inception"

        echo "wp user create"
        wp user create --allow-root "$WP_USER" "$WP_USER_MAIL" --role="author"\
                --user_pass="$WP_USER_PWD"


        touch /conf
else
        echo "Wordpress already conf"
fi
echo "Wordpress start"
#chmod -R 777 /var/www/

exec /usr/sbin/php-fpm7.3 -F

