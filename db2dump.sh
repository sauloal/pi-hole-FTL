#!/bin/bash

set -xeu

rm whitelist.txt || true
rm blacklist.txt || true
rm regex.list    || true
rm adlists.list  || true
rm gravity.list  || true

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=0 AND enabled=1 ORDER BY domain' | sort --unique > whitelist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=1 AND enabled=1 ORDER BY domain' | sort --unique > blacklist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=3 AND enabled=1 ORDER BY domain' | sort --unique > regex.list

sqlite3 /etc/pihole/gravity.db 'SELECT address FROM adlist  WHERE enabled=true ORDER BY address'           | sort --unique > adlists.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM gravity ORDER BY domain'                               | sort --unique > gravity.list
