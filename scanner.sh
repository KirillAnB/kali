#!/bin/bash

read -p "file with adresses: " FILE

function check_file() {
	if [[ -z $FILE ]]; then
	 echo "File name is empty!"
	 return 1
	elif [[ -f $FILE ]]; then
	 echo "File $FILE has been found"
	 get_ip
	 return 0
	else 
	 echo "File $FILE not found"
	 return 1
	fi
}

function get_ip() {
	for ip in $(cat $FILE); do
	  echo "----------"
	  echo $ip
	  echo "----------"
	  sleep 1
	  scan_ip "$ip"
	done
}

function scan_ip() {
	local ip=$1
	ping_result=$( ping -c 1 $1 | grep -o "bytes from" )
	if [[ -n $ping_result ]]; then
	  echo "Host $ip is up!" >> results.txt
	else
	  echo "Host $ip is down" >> results.txt
	  return 0
	fi
}

check_file || exit 1

