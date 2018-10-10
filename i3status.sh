#!/bin/bash

while :
do
	(curl -s 'https://wttr.in/~15101?u0T' | tac | tac | head -n 4 | tail -n 1 | awk '{ print $3 $4 }';echo ' | ';date +%b' '%d' '%H':'%M)|tr -d '\n'
	sleep 30
done
