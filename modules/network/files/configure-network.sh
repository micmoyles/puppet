#!/bin/bash 
if [ $( /usr/bin/id -u ) -ne 0 ]
then
	echo 'only root can run this'
	exit
fi

hostname=$( hostname )

case $hostname in
'puppet')
	echo 'Doing nothing right now'
	;;
'michael-S500CA')
	/sbin/ip route add 192.168.1.0/24 dev wlan0
	echo 'Added route for 192.168.1.0/24'
	;;
esac
