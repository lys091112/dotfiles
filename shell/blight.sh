#!/bin/bash

size=$#
light=0.5

if [ $size -eq 1 ]; then
	light=$1
fi

screen=$(xrandr --listactivemonitors | grep 0: | awk '{print $4}')

if [ -z $screen ]; then
	echo "获取屏幕标识为空"
   exit 2
fi

xrandr --output $screen --brightness $light
echo "调整屏幕 $screen 亮度为：$light"

