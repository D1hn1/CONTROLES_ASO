#!/bin/bash

source "./ejer2_dani_functions.sh"
FILE="./ficheros_de_dani.txt"

file_content=$(cat $FILE)
file_length=$(cat $FILE | wc -l )

QUIT_PRO=0
while [ $QUIT_PRO -eq 0 ]; do
	LINE=0
	random_choice=$(( $RANDOM % $file_length ))

	for line in $file_content;do
		if [ $random_choice -eq $LINE ]; then

			echo "$(date +%T\ %D)	| Picked a random number" >> output.log

			file_name=$(echo $line | cut -d ":" -f 1)
			file_path=$(echo $line | cut -d ":" -f 2)
			file_user=$(echo $line | cut -d ":" -f 3)
			file_grop=$(echo $line | cut -d ":" -f 4)
			file_cont=$(echo $line | cut -d ":" -f 5)

			echo "[*] File: $file_name"
			echo "$(date +%T\ %D)	| Selected file: $file_name" >> output.log

			simetrico $(echo $file_name | cut -d "." -f 1)
			if [ $? -eq 0 ]; then
				echo "[!] The name of the file is simetric"
				echo "$(date +%T\ %D)	| Selected file: $file_name is simetric" >> output.log
			else
				echo "[!] The name of the file is not simetric"
				echo "$(date +%T\ %D)	| Selected file: $file_name is not simetric" >> output.log
			fi

			if [ -f $file_path ]; then
				echo "[!] The file exists"
				echo "[!] Changing user:group to $file_user:$file_grop"
				chown $file_user:$file_grop $file_path
				echo "$(date +%T\ %D)	| Selected file: $file_name exists and his group has changed to $file_user:$file_grop" >> output.log
			else
				echo "[?] File does not exist creating..."
				touch $file_path
				echo $file_cont >> $file_path
				echo "[?] Contents of the file: "
				cat $file_path
				echo "$(date +%T\ %D)	| Selected file: $file_name doesnt exists, has been created and filled with his content" >> output.log
			fi
			
			read -p "[?] You want to continue? (y/n): " answ
			if [[ $answ == "n" ]]; then
				QUIT_PRO=1
			fi
			echo

		fi
		LINE=$(( $LINE + 1))
	done
done
