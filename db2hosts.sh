#!/bin/bash

set -xeu

rm hosts || true

sqlite3 -separator " " /etc/pihole/gravity.db 'SELECT "0.0.0.0", domain FROM domainlist WHERE type=1 AND enabled=true ORDER BY domain' | sort --unique > hosts
