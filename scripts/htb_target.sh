#!/bin/sh

ip_target=$(cat ~/.target | awk '{print $1}')
name_target=$(cat ~/.target | awk '{print $2}')

	if [ $ip_target ] && [ $name_target ]; then
		echo "什 $ip_target - $name_target "
	elif [ $(cat ~/.target | wc -w) -eq 1 ]; then
		echo "什 $ip_target "
	else
		echo "什%{u-} No target "
	fi
