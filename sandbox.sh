#!/bin/bash +x


echo "Checking how many args we have..."

count=0

while [[ $# -gt 0 ]]; do
	count=$((count + 1))
	stat "$1"
	shift
done


