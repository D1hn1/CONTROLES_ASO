#!/bin/bash

# 0 1 1 2 3 5 8 13 21

if [ $# -lt 1 ]; then
	echo "Input one number"
	exit 1
fi

one_bak=1
two_bak=1

for x in $(seq 0 $(( $1 - 1))); do
	if [ $x -eq 0 ]; then
		echo -n "0"
	elif [ $x -eq 1 ]; then
		echo -n "1 1"
	else
		sum=$(( $one_bak + $two_bak ))
		echo -n $sum
		two_bak=$one_bak
		one_bak=$sum
	fi
	echo -n " "
done
echo
