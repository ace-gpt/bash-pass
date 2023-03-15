#!/bin/bash

char_set="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!?@&"
length=$1
prev_char=""

# Check if the length of the password is specified
if [ -z "$length" ]; then
    echo "Usage: genpw.sh <length>"
    exit 1
fi

echo "ヽ(ˋ▽ˊ)ノ generating..."
sleep 1

# Function to generate a random password
function genpw {
    for (( i=0; i < $length; i++ )); do
        # Generate a random index into the charset
        rand=$RANDOM
        rand=$(($rand % ${#char_set}))
        char=${char_set:$rand:1}
        
        # Check if the previous character is the same as the current one
        if [ "$char" == "$prev_char" ]; then
            # Generate a new character until it's different from the previous one
            while [ "$char" == "$prev_char" ]; do
                rand=$RANDOM
                rand=$(($rand % ${#char_set}))
                char=${char_set:$rand:1}
            done
        fi
        
        # Print the current character and update the previous character
        echo -n $char
        prev_char=$char
    done
    echo
}

# Invoking Functions
password=$(genpw $length)

# Print the password
echo "✨ $password"