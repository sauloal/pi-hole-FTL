sqlite3 -separator " " /etc/pihole/gravity.db 'SELECT "0.0.0.0", domain FROM domainlist WHERE type=1 AND enabled=true' | tee hosts
