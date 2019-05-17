#!/bin/dash
# Set Initial Conditions
vortoDeLaTago=$(shuf -n 1 /home/jaron/Documents/esperanto/superaMilVorto)
getTemp=$(curl 'wttr.in/~15101?format=2')

#oldgetTemp=$(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | sed 's/ //g' | sed -r 's/[-0-9]+°F/&~&/g' | cut -d '~' -f2)

ram=$(free -h | awk '/^Mem:/ {print $3}')
#ram=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)

count=0
while :
do
	# get weather update every hour
	if ! [ $((count % 3600)) = 0 ]; then
		getTemp=$(curl 'wttr.in/~15101?format=2')
	fi

	if ! [ $((count % 30)) = 0 ]; then
		# get RAM
		ram=$(free -h | awk '/^Mem:/ {print $3}')
		maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
		appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)
	fi

	# send data to output
	(echo "${vortoDeLaTago}"; echo " | "; echo "${maxRam}"; echo "${appRam}% of ${ram}";echo ' | ';echo "${getTemp}";echo ' | ';date +%b' '%d' '%H':'%M)|tr -d '\n'

	count=$((count + 1))
	sleep 1
done
