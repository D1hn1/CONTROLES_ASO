#!/bin/bash

simetrico () {
	reverse_string=$( echo $1 | rev )
	if [ $1 == $reverse_string ]; then
		return 0
	else
		return 1
	fi
}
