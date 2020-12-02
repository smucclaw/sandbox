#!/bin/sh

# to run: sh part1.sh

(awk '{ print $1 " p 2020 " $1 " - p"}' input.txt | dc | sort | uniq -c | sort -n | tail -2 | cut -c6- ; echo "* p") | dc
