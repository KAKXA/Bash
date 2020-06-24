#!/bin/sh
disp=`xrandr | grep 2560x1440+0+0`
if [ -n "$disp" ];then
	xrandr --output HDMI-1-1 --rotate left
else
	xrandr --output HDMI-1-1 --rotate normal
fi
