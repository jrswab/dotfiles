#!/bin/sh

# DEPRECATED: Use dwmStatusBar.
# Vritten and compiled with Go.
# To view the source head to https://gitlab.com/jrswab/dwm-status

# Set Initial Conditions
vortoDeLaTago=$(shuf -n 1 "$HOME"/custom-setup/superaMilVorto)
getTemp=$(curl 'wttr.in/~15101?format=2')
ram=$(free -h | awk '/^Mem:/ {print $3}')
maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)
count=0

while :
do
	# reset count after one hour
	if [ $count -gt 3600 ]; then
		count=0;
	fi

	# get weather update every hour
	if [ $((count % 3600)) = 0 ]; then
		getTemp=$(curl 'wttr.in/~15101?format=2')
	fi

	# update ram usage every 30 seconds
	if [ $((count % 30)) = 0 ]; then
		# get RAM
		ram=$(free -h | awk '/^Mem:/ {print $3}')
		maxRam=$(ps axch -o cmd --sort=-%mem | sed 1q)
		appRam=$(ps axch -o %mem --sort=-%mem | sed 1q)
	fi

	# send data to output
	xsetroot -name "$(echo "$count"|tr -d ' ';echo " | ";echo "${vortoDeLaTago}";
	  echo " | ";echo "${maxRam}";echo "${appRam}% of ${ram}";echo ' | ';
		echo "${getTemp}";echo ' | ';date +%s;echo ' | ';date +%b' '%d' '%H':'%M)"|tr -d '\n'

	count=$((count + 1))
	sleep 1
done
