#!/bin/bash

set -xeu

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=0 AND enabled=1 ORDER BY domain' | uniq > whitelist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=1 AND enabled=1 ORDER BY domain' | uniq > blacklist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=3 AND enabled=1 ORDER BY domain' | uniq > regex.list

sqlite3 /etc/pihole/gravity.db 'SELECT address FROM adlist  WHERE enabled=true ORDER BY address' | uniq > adlists.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM gravity ORDER BY domain' | uniq > gravity.list
