#!/bin/bash
if [ ! -f /conf ]
then
        rm -f /var/www/wp-config.php

        echo "wp core download"
        wp core download --allow-root --path="/var/www/"

        echo "wp config create"
        until wp config create --allow-root --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --path="/var/www/"
        do
                sleep 1
        done

        echo "wp core install"
        wp core install --allow-root --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PWD"\
                --admin_email="$ADMIN_MAIL" --url="${URL}/" --title="Inception" --path="/var/www/"

        echo "wp user create"
        wp user create --allow-root "$WP_USER" "$WP_USER_MAIL" --role="author"\
                --user_pass="$WP_USER_PWD" --path="/var/www/"


        touch /conf
else
        echo "Wordpress already conf"
fi
echo "Wordpress start"
chmod -R 777 /var/www/
exec /usr/sbin/php-fpm7.3 -F


