#!/bin/sh

ip_target=$(cat ~/.target | awk '{print $1}')
name_target=$(cat ~/.target | awk '{print $2}')

	if [ $ip_target ] && [ $name_target ]; then
		echo "%{F#ffffff}什%{F#ffffff} $ip_target - $name_target "
	elif [ $(cat ~/.target | wc -w) -eq 1 ]; then
		echo "%{F#ffffff}什%{F#ffffff} $ip_target "
	else
		echo "%{F#ffffff}什%{u-}%{F#ffffff} No target "
	fi
