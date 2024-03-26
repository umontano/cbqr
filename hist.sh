CBQ_comandos_SPSS_lab_ChyC
exit 0
#COPY HUGO FILES
ssh -p 8022 u0_a66@192.168.0.13 '
cd ~/a/CBQ_*/;
ls;
pwd;
git pull;
'
scp *.[Rtm]* ~/a/cbqr/;


#
#!/bin/sh
date=$(date +%y%m)
filename=tvhist"$date".txt

scp -P 8022 ~/.bash_history u0_a66@192.168.0.13:~/p/history/"$filename"
cp -vf ~/.bash_history /sdcard/"$filename"

