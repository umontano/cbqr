#!/bin/sh
date=$(date +%y%m)
filename=tvhist"$date".txt

scp -P 8022 ~/.bash_history u0_a66@192.168.0.13:~/p/history/"$filename"
cp -vf ~/.bash_history /sdcard/"$filename"

