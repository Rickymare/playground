#!/usr/bin/env bash

set -e
set -u

# Ask user what would they like to do?
echo "What would you like to do?"
echo "1. Deploy web task"
echo "2. Deploy data task"
echo "3. Deploy both"

read server

if [ $server = "web" ]
then
    echo "Executing web tasks"
elif [ $server = "data" ]
then
	echo "Executing data tasks"
elif [ $server = "both" ]
then
	echo "Executing web tasks"
	echo "Executing data tasks"
fi
