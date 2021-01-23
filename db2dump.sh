sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=0 AND enabled=1 ORDER BY domain' > whitelist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=1 AND enabled=1 ORDER BY domain' > blacklist.txt
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM domainlist WHERE type=3 AND enabled=1 ORDER BY domain' > regex.list

sqlite3 /etc/pihole/gravity.db 'SELECT address FROM adlist  WHERE enabled=true ORDER BY address' > adlists.list
sqlite3 /etc/pihole/gravity.db 'SELECT domain  FROM gravity ORDER BY domain' > gravity.list
