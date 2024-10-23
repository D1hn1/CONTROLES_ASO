#!/bin/bash

if [ $# -lt 3 ]; then
	echo "Input 3 numbers"
	exit 1
fi

source ./ejer1_dani_functions.sh
declare -A array

array["numeros"]="$1 $2 $3"
suma $1 $2 $3
array["suma"]=$?
media $1 $2 $3
array["media"]=$?
producto $1 $2 $3
array["producto"]=$?
mayor $1 $2 $3
array["mayor"]=$?
menor $1 $2 $3
array["menor"]=$?

QUIT=0
while [ $QUIT -eq 0 ]; do
	clear
	echo "Los números son: " ${array["numeros"]}
	echo "1.  suma"
	echo "2.  media"
	echo "3.  producto"
	echo "4.  mayor"
	echo "5.  menor"
	echo "6.  salir"
	read -p "Que quieres hacer?: " answ
	echo

	case $answ in
		1) echo ${array["suma"]}     ;;
		2) echo ${array["media"]}    ;;
		3) echo ${array["producto"]} ;;
		4) echo ${array["mayor"]}    ;;
		5) echo ${array["menor"]}    ;;
		6) exit 0    		     ;;
		*) continue		     ;;
	esac

	read -p "Press enter to continue..."
done
