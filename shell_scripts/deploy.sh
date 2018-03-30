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

if [ $server = "web" ]
then
    web_tasks
elif [ $server = "data" ]
then
	data_tasks
elif [ $server = "both" ]
then
	data_tasks
	web_tasks
fi
