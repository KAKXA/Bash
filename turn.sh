#!/bin/sh
disp=`xrandr | grep 2560x1440+0+0`
if [ -n "$disp" ];then
	xrandr -o left
else
	xrandr -o normal
fi
