#!/bin/bash +x


echo "Starting..."
sleep 1
while true; do
	read -p "Enter a file name: " file_name
	if [[ -z $file_name ]]; then
		echo 'Enter file name pls: '
		continue
	elif [[ -f $file_name ]]; then
	echo "File is found"
	break
	else
	echo "file was not found"
	break
fi
done

