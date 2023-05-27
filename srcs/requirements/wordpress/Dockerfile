FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 9000

RUN mkdir -p /var/www/html
RUN mkdir -p /usr/bin/wp
RUN mkdir -p /usr/bin/wp
RUN mkdir -p /run/php
RUN mkdir -p /var/lib/docker/volumes/wp/_data


RUN apt-get update
RUN apt-get -y install php7.3\
        php7.3-fpm\
        php7.3-cli\
        mariadb-client\
        php-mysql\
        wget

RUN uname -m

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN chmod -R 777 /run/php
RUN cp wp-cli.phar /usr/local/bin/wp

COPY ./tools/wordpress_start.sh /var/www/
COPY ./tools/www.conf /etc/php/7.3/fpm/php-fpm.conf

RUN chmod -R 755 /etc/php/7.3/fpm/php-fpm.conf
RUN chmod -R 755 /var/www/
RUN chown -R www-data:www-data /etc/php/7.3/fpm/php-fpm.conf
RUN chmod a+x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]
