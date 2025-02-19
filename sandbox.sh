#!/bin/bash


read -p "Enter an ip: " ip

echo "$ip"

IFS="."
count=1
for oct in $ip; do
	echo "octet $count"
	echo $oct
	count=$(($count+1))
done

