#!/bin/bash
count=0

getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | sed 's/ //g' | sed -r 's/[-0-9]+°F/&~&/g' | cut -d '~' -f2)

while :
do
	# get RAM
	ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
	# send data to output
	(echo "${ram}";echo ' | ';echo "${getTemp}";echo ' | ';date +%b' '%d' '%H':'%M)|tr -d '\n'
	
	# get weather update every hour
	count=$((count + 1))
	if ! ((count % 3600)); then
		getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | sed 's/ //g' | sed -r 's/[-0-9]+°F/&~&/g' | cut -d '~' -f2)
	fi

	sleep 1
done
