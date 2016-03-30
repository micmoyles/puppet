#!/bin/bash

days=$(seq -f "%02g" 1 9)
months=$(seq -f "%02g" 8 9 )
#baseURL="http://www.chelseacharms.com/members/zip/newsarc"
baseURL="http://www.chelseacharms.com/members/videos/vid"
#baseURL="http://www.chelseacharms.com/members/zip/archive"

for month in $months 
do 
	for day in $days 
	#for j in {0..9} 
	do 
		vid=$(echo $month$day"2015.mp4")
		arc=$(echo $i-$j".zip")
		#echo $baseURL$vid
		header=$(curl --head  -u mikey86:wiarreft86 $baseURL$vid -o /mnt/data/Chelsea/$vid )
		
		#curl -u mikey86:wiarreft86 $baseURL$month$day"2009.zip" -o images/$month$day"2009.zip"	
done
done
