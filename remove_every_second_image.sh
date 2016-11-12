#!/bin/bash

#find /var/cache/zoneminder/events/ -mindepth 7 -maxdepth 7 -type d -mtime +14 | tee -a /home/rosa/razredjeni.log | xargs -I folder bash -c "find folder -maxdepth 1 -type f | sort| awk '0==NR%2 { system(\" sudo rm \"\$1 ); } '"
echo "iskljuc------------------- `date` ------------------" >> /home/rosa/razredjeni.log
