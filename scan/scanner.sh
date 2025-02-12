#!/bin/bash

read -p "file with adresses: " FILE

function if_results() {
	for file in ./*; do
	  echo $file
	done
}

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

function if_results() {
        for file in *; do
          echo $file
          if [[ $file == results.txt ]]; then
            echo "File results has been found"
            read -p "Delete file ?(y/n): " comand
            if [[ $comand == 'y' ]]; then
                echo "Deleteng results file..."
                rm results.txt
            fi
          fi
        done
}

if_results
check_file || exit 1

cat << _eof_ > scan_results.html
<!DOCTYPE html>
<html>
    <head>
        <title>DNS Brute-Force Results</title>
    </head>
    <body>
        <h1>DNS Brute-Force Results for $domain_name</h1>
        <pre>
$(cat results.txt)
        </pre>
    </body>
</html>
_eof_

firefox scan_results.html

