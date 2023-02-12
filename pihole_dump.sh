#!/bin/bash

set -xeu

rm pihole_whitelist.txt   || true
rm pihole_blacklist.txt   || true
rm pihole_regex.txt       || true
rm pihole_white-regex.txt || true
rm pihole_wild.txt        || true
rm pihole_white-wild.txt  || true


pihole --whitelist   --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_whitelist.txt

pihole --blacklist   --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_blacklist.txt

pihole --regex       --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_regex.txt

pihole --white-regex --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_white-regex.txt

pihole --wild        --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_wild.txt

pihole --white-wild  --list | awk '{print $2}' | tail -n +2 | sort --unique > pihole_white-wild.txt

