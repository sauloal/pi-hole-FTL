#!/bin/bash

set -xeu

pihole -w -l | awk '{print $2}' | tail -n +2 | sort > pihole_whitelist.txt

pihole -b -l | awk '{print $2}' | tail -n +2 | sort > pihole_blacklist.txt

pihole  --regex --list | awk '{print $2}' | tail -n +2 | sort > pihole_regex.txt

pihole  --white-regex --list | awk '{print $2}' | tail -n +2 | sort > pihole_white-regex.txt

pihole  --wild --list | awk '{print $2}' | tail -n +2 | sort > pihole_wild.txt

pihole  --white-wild --list | awk '{print $2}' | tail -n +2 | sort > pihole_white-wild.txt

