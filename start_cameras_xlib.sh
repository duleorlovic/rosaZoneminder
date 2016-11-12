#!/bin/bash
export DISPLAY=:0.0
crontab cr.txt
sleep 30 
xset -dpms
xset s  noblank
xset  s off
sudo xlib_shm  -m1 -m2 -m3 -m4 -m8 -m9 -c 3 -d100000

