#!/bin/bash

charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!?@#$%^&*<>"
length=$1

# Function to generate a random password
function genpw {
	for (( i=0; i < $length; i++ )); do
		rand=$RANDOM
		rand=$(($rand % ${#charset}))
		echo -n ${charset:$rand:1}
	done
	echo
}

# Invoking Functions
genpw $length