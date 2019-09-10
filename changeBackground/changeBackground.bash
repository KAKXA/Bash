#! /bin/bash
source /etc/profile
env LANG=en_US.UTF-8
picPath=/home/zgk/Pictures/	# assign picPath your own picture directory as a value
cd $picPath
picNum=`ls -l | grep "^-" | wc -l`
ramNum=`date +%s`		# develop a random integer
ramNum=`expr $ramNum + $RANDOM `
j=0
folderList[0]=a
for i in `ls -1`		# fill an array with the names of pictures
do
	folderList[$j]="$i"
    	j=`expr $j + 1`
done

result=`expr $ramNum % $picNum`
echo background:${folderList[$result]} `date`>> /home/zgk/program/Bash/changeBackground/start1.log		# if you want to see which one it makes, you can remove "#"
#gsettings set org.gnome.desktop.background picture-uri $picPath${folderList[$result]}
sudo -H -u zgk DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus gsettings set org.gnome.desktop.background picture-uri $picPath${folderList[$result]}

result=$(expr $[ $result * $RANDOM ] % $picNum)
echo screensaver:${folderList[$result]} `date`	>> /home/zgk/program/Bash/changeBackground/start2.log # if you want to see which one it makes, you can remove "#"
#gsettings set org.gnome.desktop.screensaver picture-uri $picPath${folderList[$result]}
sudo -H -u zgk DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus gsettings set org.gnome.desktop.screensaver picture-uri $picPath${folderList[$result]}
