#!/bin/bash

firstMonth=$1
secondMonth=$2
days=$(seq -f "%02g" 1 31)
months=$(seq -f "%02g" $firstMonth $secondMonth )
#baseURL="http://www.chelseacharms.com/members/zip/newsarc"
baseURL="http://www.chelseacharms.com/members/videos/vid"
#baseURL="http://www.chelseacharms.com/members/zip/archive"

for month in $months
do
	for day in $days
	do
		vid=$(echo $month$day"2016.mp4")
		arc=$(echo $i-$j".zip")
	#	echo $baseURL$vid
		header=$(curl --head --silent  -u mikey86:wiarreft86 $baseURL$vid | grep -i video )
		if [ ${#header} -gt 0 ]
		then
			echo $vid $header
		fi
		#curl --silent -u mikey86:wiarreft86 $baseURL$vid -o /mnt/data/Chelsea/$vid

#		curl -u mikey86:wiarreft86 $baseURL$month$day"2016.zip" -o /mnt/data/Chelsea/$month$day"2016.zip"
done
done
