#!/bin/bash


read -p "Enter a num: " num

#comment 1
for((i=0;i<$num;++i));do
	echo $i
	echo "result is $(($i*$num))"
	echo "Iteration $i

