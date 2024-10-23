#!/bin/bash

suma () {
	return $(( $1 + $2 + $3 ))
}

media () {
	return $(( ( $1 + $2 + $3 ) / $# ))
}

producto () {
	return $(( $1 * $2 * $3 ))
}

mayor () {
	mayor=0
	for num in $@; do
		if [ $num -gt $mayor ]; then
			mayor=$num
		fi
	done
	return $mayor
}

menor () {
	mayor $1 $2 $3
	menor=$?
	for num in $@; do
		if [ $num -lt $menor ]; then
			menor=$num
		fi
	done
	return $menor
}

