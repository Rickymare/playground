#!/usr/bin/env bash

# Ask user is shell script is running on same server or different servers
echo "Is this running on the same server or different servers?"

read ans

echo "This is running on $ans servers"

# I am about to run a.sh
echo "I am about to run a.sh"
./a.sh $ans

# I am about to run b.sh
echo "I am about to run b.sh"
./b.sh $ans