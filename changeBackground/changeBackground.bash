#! /bin/bash
picPath=/home/zgk/Pictures/	# assign picPath your own picture directory as a value
cd $picPath
picNum=`ls -l | grep "^-" | wc -l`
ramNum=`date +%s`		# develop a random integer
j=0
folderList[0]=a
for i in `ls -1`		# fill an array with the names of pictures
do
	folderList[$j]="$i"
    	j=`expr $j + 1`
done

result=`expr $ramNum % $picNum`
echo background:${folderList[$result]} >> /home/zgk/start1.log		# if you want to see which one it makes, you can remove "#"
gsettings set org.gnome.desktop.background picture-uri $picPath${folderList[$result]}

sleep 0.1
a=0
while  [ "$a" -eq "0" ]
do
	a=`date +%s`
done

result=$(expr $[ $result + $a ] % $picNum)
echo screensaver:${folderList[$result]}	>> /home/zgk/start2.log # if you want to see which one it makes, you can remove "#"
gsettings set org.gnome.desktop.screensaver picture-uri $picPath${folderList[$result]}
