#!/bin/sh
echo "usao $1 `date`">>/home/rosa/smslog
/usr/local/bin/smssend.php dule "usao $1"

