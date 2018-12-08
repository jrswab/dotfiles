#!/bin/bash
count=0

getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | sed 's/ //g' | sed -r 's/[-0-9]+°F/&~&/g' | cut -d '~' -f2)

ram=$(free -h | awk '/^Mem:/ {print $3}')
#ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)

while :
do
	# send data to output
	(echo " ${maxRam}";echo "$appRam% of ${ram}";echo ' | ';echo "${getTemp}";echo ' | ';date +%b' '%d' '%H':'%M)|tr -d '\n'
	
	# get weather update every hour
	count=$((count + 1))
	if ! ((count % 3600)); then
		getTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | sed 's/ //g' | sed -r 's/[-0-9]+°F/&~&/g' | cut -d '~' -f2)
	fi

	if ! ((count % 30)); then
		# get RAM
		ram=$(free -h | awk '/^Mem:/ {print $3}')
		maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
		appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)
	fi

	sleep 1
done
