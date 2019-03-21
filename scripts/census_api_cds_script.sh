#!/bin/bash
for input in $(cat cds.txt)
do
 for var in $(cat vars.txt)
  do
	state=`echo $input | awk -F~ '{print $1}'`
	cd=`echo $input | awk -F~ '{print $2}'`
	echo state,$state,cd,$cd,var,$var
	value=`curl -s "https://api.census.gov/data/2017/acs/acs5/profile?key=fd901c69fb4729a262b7e163c1db69737513827d&get=$var&for=congressional%20district%3A$cd&in=state%3A$state" | jq .[1][0] | tr -d \"`
	echo $state,$cd,$var,$value >>result.txt
	#sleep 1
  done
done
