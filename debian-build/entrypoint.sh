#!/bin/bash

wget https://www.pgbouncer.org/downloads/files/$PGBOUNCER_VERSION/pgbouncer-$PGBOUNCER_VERSION.tar.gz \
    && tar -xvzf pgbouncer-$PGBOUNCER_VERSION.tar.gz \
    && rm -rf pgbouncer-$PGBOUNCER_VERSION.tar.gz

git clone https://salsa.debian.org/postgresql/pgbouncer.git pgbouncer-debian

cp -rp pgbouncer-debian/debian pgbouncer-$PGBOUNCER_VERSION

sed -i 's/debhelper-compat (= 13)/debhelper/g' pgbouncer-$PGBOUNCER_VERSION/debian/control \
    && sed -i 's/PATH=$(PGBINDIR):$(PATH)/PATH=$(PGBINDIR):$(PATH) || true/g' pgbouncer-$PGBOUNCER_VERSION/debian/rules

echo 9 > pgbouncer-$PGBOUNCER_VERSION/debian/compat

cd pgbouncer-$PGBOUNCER_VERSION

debuild -b || true

cp -rp ../pgbouncer*_$PGBOUNCER_VERSION* /mnt/build
