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
    if [ $tasks = "help" ]
    then
        echo "Server options: web. data, or both"
        exit 0
    elif [ $tasks = "web" ]
    then
        web_tasks
    elif [ $tasks = "data" ]
    then
        data_tasks
    elif [ $tasks = "both" ]
    then
        web_tasks
        data_tasks
    fi
else
    echo "What would you like to launch?"
    echo "1. Deploy web task"
    echo "2. Deploy data task"
    echo "3. Deploy both tasks"
    read server
    if [ $server = "web" ] || [ $server = "1" ]
    then
        web_tasks
    elif [ $server = "data" ] || [ $server = "2" ]
    then
        data_tasks
    elif [ $server = "both" ] || [ $server = "3" ]
    then
        web_tasks
        data_tasks
    fi
fi
