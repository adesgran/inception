FROM debian:buster

EXPOSE 3306

RUN mkdir -p /tmp
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/docker/volumes/db
RUN mkdir -p /var/lib/mysql

RUN     apt-get update
RUN     apt-get -y install mariadb-server\
        mariadb-client\
        procps

RUN chown -R mysql:mysql /tmp
RUN chown -R mysql:mysql /var/lib/mysql

COPY ./tools/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mariadb_start.sh /tmp/mariadb_start.sh


RUN chmod a+x /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod a+x /tmp/mariadb_start.sh

ENTRYPOINT [ "/tmp/mariadb_start.sh" ]



