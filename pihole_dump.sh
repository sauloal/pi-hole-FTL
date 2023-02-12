#!/bin/bash

set -xeu

rm dump_blacklist.txt          || true
rm dump_blacklist-regex.txt    || true
rm dump_blacklist-wildcard.txt || true

rm dump_whitelist.txt          || true
rm dump_whitelist-regex.txt    || true
rm dump_whitelist-wildcard.txt || true


pihole --blacklist   --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_blacklist.txt

pihole --regex       --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_blacklist-regex.txt

pihole --wild        --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_blacklist-wildcard.txt


pihole --whitelist   --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_whitelist.txt

pihole --white-regex --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_whitelist-regex.txt

pihole --white-wild  --list | awk '{print $2}' | tail -n +2 | sort --unique > dump_whitelist-wildcard.txt

