#!/bin/sh

delim="|"

status() {
	
	echo "$delim"
	
	echo "Vol:"
	
	amixer sget Master | grep 'Mono:' | awk -F'[][]' '{ print $2 }'
	
	echo "$delim"

	date +"%a %d ~ %R"
}

status

while :; do

	xsetroot -name "$(status | tr '\n' ' ')"	


	sleep 1m

done
