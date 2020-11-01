FROM debian:stretch
  
MAINTAINER Muhammad Aqeel <aqeelmail@gmail.com>

LABEL vendor="Aqeel" \
      architecture="x86_64" \
      remarks="This is a Dockerfile to build pgbouncer debian 9 packages"


RUN apt-get update \
    && apt-get install -y wget git devscripts build-essential postgresql libc-ares-dev libevent-dev

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
