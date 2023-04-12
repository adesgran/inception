FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /var/www/html
RUN mkdir -p /usr/bin/wp
RUN mkdir -p /usr/bin/wp
RUN mkdir -p /var/lib/docker/volumes/wp/_data


RUN apt-get update
RUN apt-get -y install php7.3\
        php7.3-fpm\
        php7.3-cli\
        mariadb-client\
        php-mysql\
        php-fpm\
        wget\
        sendmail\
        dialog\
        apt-utils
RUN apt-get clean

RUN uname -m

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN cp wp-cli.phar /usr/local/bin/wp

COPY ./tools /var/www/
COPY ./tools/www.conf /etc/php/7.3/fpm/php-fpm.conf

RUN chmod a+x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

#CMD ["sh", "/wordpress_start.sh"]
