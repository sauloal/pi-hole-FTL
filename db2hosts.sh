#!/bin/bash

set -xeu

rm db_hosts-enabled  || true
rm db_hosts-disabled || true

sqlite3 -separator " " /etc/pihole/gravity.db 'SELECT "0.0.0.0", domain FROM domainlist WHERE type=1 AND enabled=1 ORDER BY domain' | sort --unique > db_hosts-enabled
sqlite3 -separator " " /etc/pihole/gravity.db 'SELECT "0.0.0.0", domain FROM domainlist WHERE type=1 AND enabled=0 ORDER BY domain' | sort --unique > db_hosts-disabled
