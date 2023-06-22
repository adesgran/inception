#!/bin/bash
if [ ! -f /var/www/html/wordpress/wp-config.php ]
then
        rm -f /var/www/html/wordpress/wp-config.php

        wp core download --allow-root --path="/var/www/html/wordpress"

        until wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="mariadb:3306" --dbcharset="utf8" --dbcollate="utf8_general_ci"
        do
                sleep 3
        done

        wp core install --allow-root --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD"\
                --admin_email="$ADMIN_MAIL" --url="${URL}/" --title="Inception"

        wp user create --allow-root "$WP_USER" "$WP_USER_MAIL" --role="author"\
                --user_pass="$WP_USER_PWD"


        touch /conf
else
        echo "wp conf file already exist"
fi
echo "wp start"

exec /usr/sbin/php-fpm7.3 -F

