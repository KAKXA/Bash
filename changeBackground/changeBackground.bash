#! /bin/bash
disp=`xrandr | grep 2560x1440+0+0`
if [ -n "$disp" ];then
	picPath=~/Pictures/	# assign picPath your own picture directory as a value
else
	picPath=~/Tall-Pictures/
fi

source /etc/profile
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
gsettings set org.gnome.desktop.background picture-uri $picPath${folderList[$result]}
#use this may be okay, but the next row better for rc.local(not necessary now)
#sudo -H -u zgk DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus gsettings set org.gnome.desktop.background picture-uri $picPath${folderList[$result]}

result=$(expr $[ $result * $RANDOM ] % $picNum)
gsettings set org.gnome.desktop.screensaver picture-uri $picPath${folderList[$result]}
#use this may be okay, but the next row better for rc.local(not necessary now)
#sudo -H -u zgk DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus gsettings set org.gnome.desktop.screensaver picture-uri $picPath${folderList[$result]}
