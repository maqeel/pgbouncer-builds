FROM debian:stretch
  
MAINTAINER Muhammad Aqeel <aqeelmail@gmail.com>

LABEL vendor="Aqeel" \
      architecture="x86_64" \
      remarks="This is a Dockerfile to build pgbouncer debian 9 packages"


RUN apt-get update \
    && apt-get install -y wget git devscripts build-essential python3 libevent-dev libpam0g-dev libc-ares-dev libssl-dev pkg-config libpq-dev pandoc postgresql

RUN mkdir /mnt/build
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
