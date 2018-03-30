#!/usr/bin/env bash

set -e
set -u

# Ask user would they like to do?
echo "What would you like to do?"
echo "1. Deploy web server"
echo "2. Deploy data server"
echo "3. Deploy both"

read server

if [ $server = "1" ]
then 
		echo "Executing web server"
elif [ $server = "2" ]
then
		echo "Executing data server"
elif [ $server = "3" ]
then
		echo "Executing web and data servers"
fi
