#!/usr/bin/env bash

# I am about to run a.sh
echo "I am about to run a.sh"
./a.sh

# I am about to run b.sh
echo "I am about to run b.sh"
./b.sh

# Ask user is shell script is running on same server or different servers
echo "Is this running on the same server or different servers?"

read ans

echo "this is running on" $ans "servers"
