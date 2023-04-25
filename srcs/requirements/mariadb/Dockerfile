FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

EXPOSE 3306

ARG DB_NAME
ARG DB_USER
ARG DB_PASS

RUN mkdir -p /tmp
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/docker/volumes/db
RUN mkdir -p /var/lib/mysql

RUN     apt-get update
RUN     apt-get -y install mariadb-server\
        mariadb-client

RUN chown -R mysql:mysql /tmp
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
#COPY ./tools/mariadb.conf /etc/mysql/my.conf
COPY ./tools/mariadb_start.sh /tmp/mariadb_start.sh
COPY ./tools/dbscript /tmp/dbscript


RUN chmod a+x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod a+x /tmp/mariadb_start.sh

ENTRYPOINT [ "/tmp/mariadb_start.sh" ]



