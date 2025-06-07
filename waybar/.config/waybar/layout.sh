#!/bin/bash

layout=$(hyprctl getoption general:layout | grep 'str:' | awk '{print $2}')

case "$layout" in
	master)
		echo "[]="
		;;
	dwindle)
		echo "*="
		;;
	*)
		echo "??"
		;;
esac
