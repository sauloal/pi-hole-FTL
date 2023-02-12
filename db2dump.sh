#!/bin/bash

set -xeu

rm db_whitelist-exact-enabled.list  || true
rm db_whitelist-exact-disabled.list || true

rm db_blacklist-exact-enabled.list  || true
rm db_blacklist-exact-disabled.list || true

rm db_whitelist-regex-enabled.list  || true
rm db_whitelist-regex-disabled.list || true

rm db_blacklist-regex-enabled.list  || true
rm db_blacklist-regex-disabled.list || true

rm db_adlists-enabled.list          || true
rm db_adlists-disabled.list         || true

rm db_gravity.list                  || true

#https://docs.pi-hole.net/database/gravity/#domain-tables-domainlist
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=0 AND enabled=1 ORDER BY domain' | sort --unique > db_whitelist-exact-enabled.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=0 AND enabled=0 ORDER BY domain' | sort --unique > db_whitelist-exact-disabled.list

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=1 AND enabled=1 ORDER BY domain' | sort --unique > db_blacklist-exact-enabled.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=1 AND enabled=0 ORDER BY domain' | sort --unique > db_blacklist-exact-disabled.list

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=2 AND enabled=1 ORDER BY domain' | sort --unique > db_whitelist-regex-enabled.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=2 AND enabled=0 ORDER BY domain' | sort --unique > db_whitelist-regex-disabled.list

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=3 AND enabled=1 ORDER BY domain' | sort --unique > db_blacklist-regex-enabled.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=3 AND enabled=0 ORDER BY domain' | sort --unique > db_blacklist-regex-disabled.list

sqlite3 /etc/pihole/gravity.db 'SELECT address FROM adlist  WHERE enabled=1 ORDER BY address'              | sort --unique > db_adlists-enabled.list
sqlite3 /etc/pihole/gravity.db 'SELECT address FROM adlist  WHERE enabled=0 ORDER BY address'              | sort --unique > db_adlists-disabled.list

sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM gravity ORDER BY domain'                               | sort --unique > db_gravity.list
