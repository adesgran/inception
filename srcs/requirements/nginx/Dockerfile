FROM debian:buster

RUN     apt-get update -y
RUN     apt-get upgrade -y
RUN     apt-get install -y nginx\
                vim\
                curl

RUN     mkdir -p /etc/nginx/ssl
RUN     mkdir -p /var/run/nginx
RUN     apt-get install -y openssl
RUN     openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
        -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=adesgran.42.fr/UID=adesgran"
RUN     mkdir -p /var/www
RUN     chmod -R 777 /var/www/
RUN     chmod -R 777 /var/www/html
RUN     chown -R www-data:www-data /var/www/

COPY    ./tools/nginx.conf /etc/nginx/nginx.conf
ADD     ./tools/default.conf /etc/nginx/conf.d/

CMD [ "nginx", "-g", "daemon off;" ]

