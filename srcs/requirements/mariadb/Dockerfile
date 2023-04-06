FROM debian:buster

RUN mkdir -p /var/lib/docker/volumes/db

RUN     apt-get update
RUN     apt-get -y install mariadb-server\
        mariadb-client\
        software-properties-common

COPY ./tools/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

