#!/usr/bin/env bash

set -e
set -u

web_tasks () {
	echo "Executing web tasks"
}

data_tasks () {
	echo "Executing data tasks"
}

# Ask user what would they like to do?
echo "What would you like to do?"
echo "1. Deploy web task"
echo "2. Deploy data task"
echo "3. Deploy both"

read server

if [ $server = "web" ] || [ $server = "1" ]
then
    web_tasks
elif [ $server = "data" ] || [ $server = "2" ]
then
	data_tasks
elif [ $server = "both" ] || [ $server = "3" ]
then
	data_tasks
	web_tasks
else
	echo "Choose between 'web' 'data' or 'both'"
fi
