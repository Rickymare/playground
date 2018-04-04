#!/usr/bin/env bash

set -e
set -u

# Functions
web_tasks () {
	echo "Executing web tasks"
}

data_tasks () {
	echo "Executing data tasks"
}


# Check to see if there are any arguments
if [ $# -ge 1 ]
then
    tasks=$1
else
    echo "What would you like to launch?"
    echo "1. Deploy web task"
    echo "2. Deploy data task"
    echo "3. Deploy both"
    read tasks
fi

if [ $tasks = "web" ] || [ $tasks = "1" ]
then
    web_tasks
elif [ $tasks = "data" ] || [ $tasks = "2" ]
then
    data_tasks
elif [ $tasks = "both" ] || [ $tasks = "3" ]
then
    web_tasks
    data_tasks
elif [ $tasks = "help" ]
then
    echo "Server options: web, data, or both"
    exit 0
fi
