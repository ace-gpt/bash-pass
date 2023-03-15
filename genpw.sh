#!/bin/bash

# Charset for password
charset="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?@&"
# Get the length of the password
length=$1

# Check if the length is specified
if [ -z "$length" ]; then
    echo "Usage: genpw.sh <length>"
    exit 1
fi

echo "ヽ(ˋ▽ˊ)ノ generating..."
sleep 1

# Function to generate a random password
function genpw {
    for (( i=0; i < $length; i++ )); do
    # Generate a random character
    rand=$(od -vAn -N4 -tu4 < /dev/urandom)
    rand=$(($rand % ${#charset}))
    char=${charset:$rand:1}

    # Check if previous char is the same as the current char
    if [ "$char" == "$prev_char" ]; then
        # Generate a new random character
        while [ "$char" == "$prev_char" ]; do
            rand=$(($rand % ${#charset}))
            char=${charset:$rand:1}
        done
    fi

    # Print the character and update the previous character
    echo -n $char
    prev_char=$char
    done
}

# Invoking Functions
password=$(genpw)

# Print the password
echo "✨ $password"