#! /bin/bash

echo "lets work with read and reply"
sleep 1

while true; do
	echo -n "Enter your name: "
	read name
	sleep 1
	echo -n	"Hi $name!One more time or no?('exit' for quit)"
	read 
	if [[ $REPLY == "exit" ]]; then
		echo "Goodbye!"
		sleep 1
		break
	else
		continue
	fi
done

