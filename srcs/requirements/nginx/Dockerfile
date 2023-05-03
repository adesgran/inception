FROM debian:buster

RUN     apt-get update -y
RUN     apt-get install -y nginx\
                vim\
                curl\
                openssl

RUN     mkdir -p /etc/nginx/ssl
RUN     mkdir -p /var/run/nginx
RUN     mkdir -p /var/www
RUN     chmod 777 /var/www
RUN     chown -R www-data:www-data /var/www

RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=adesgran.42.fr/UID=adesgran"

COPY    ./tools/nginx.conf /etc/nginx/nginx.conf
ADD     ./tools/default.conf /etc/nginx/conf.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]

