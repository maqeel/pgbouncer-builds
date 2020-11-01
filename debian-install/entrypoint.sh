#!/bin/bash

cd /github/workspace/output
dpkg -i pgbouncer_$INPUT_PGBOUNCER_VERSION*.deb
