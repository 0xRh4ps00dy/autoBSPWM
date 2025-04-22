#!/bin/sh

echo "$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"
