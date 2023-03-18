FROM debian:10.12.0
RUN     apt update && apt upgrade && apt add --no-cache \
        mariadb \
        mariadb-client

COPY tools/configure.sh /tmp/configure.sh

ENTRYPOINT ["sh", "/tmp/configure.sh"]
