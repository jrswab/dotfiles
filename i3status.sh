#!/bin/bash
count=0

getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | 
	head -n 4 | tail -n 1 | awk '{ print $2 $3 $4 }')

while :
do
	# send data to output
	(echo "${getTemp}";echo ' | ';date +%b' '%d' '%H':'%M)|tr -d '\n'
	
	# get weather update every hour
	count=$((count + 1))
	if ! ((count % 3600)); then
		getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | 
			head -n 4 | tail -n 1 | awk '{ print $3 $4 }')
	fi

	sleep 1
done
