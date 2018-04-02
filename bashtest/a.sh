#!/usr/bin/env bash

if [ $1 = "same" ]
then
    echo “I’m running on the same server as the other scripts”
		
elif [ $1 = "different" ]
then
    echo "I’m doing something completely different"
		
else
    echo "Something unexpected happened"
fi
