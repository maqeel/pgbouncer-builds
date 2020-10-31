#!/bin/bash

wget https://www.pgbouncer.org/downloads/files/$INPUT_PGBOUNCER_VERSION/pgbouncer-$INPUT_PGBOUNCER_VERSION.tar.gz \
    && tar -xvzf pgbouncer-$INPUT_PGBOUNCER_VERSION.tar.gz \
    && rm -rf pgbouncer-$INPUT_PGBOUNCER_VERSION.tar.gz

git clone https://salsa.debian.org/postgresql/pgbouncer.git pgbouncer-debian

cp -rp pgbouncer-debian/debian pgbouncer-$INPUT_PGBOUNCER_VERSION

sed -i 's/debhelper-compat (= 13)/debhelper/g' pgbouncer-$INPUT_PGBOUNCER_VERSION/debian/control \
    && sed -i 's/PATH=$(PGBINDIR):$(PATH)/PATH=$(PGBINDIR):$(PATH) || true/g' pgbouncer-$INPUT_PGBOUNCER_VERSION/debian/rules

echo 9 > pgbouncer-$INPUT_PGBOUNCER_VERSION/debian/compat

cd pgbouncer-$INPUT_PGBOUNCER_VERSION

debuild -b || true

echo "Current directory=$PWD"
mkdir -p ../output
cp -rp ../pgbouncer*_$INPUT_PGBOUNCER_VERSION* ../output
