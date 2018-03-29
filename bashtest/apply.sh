#!/usr/bin/env bash

# Ask user is shell script is running on same server or different servers
echo "Is this running on the same server or different servers?"

read ans

if [ $ans = "different" ]
then
	echo "What is the name of server A?"
	read server_name_a
	echo "What is the name of server B"?
	read server_name_b
fi

if [ -n $server_name_a ]
then
	./a.sh $ans $server_name_a
else
	./a.sh $ans
fi

if [ -n $server_name_b ]
then
	./b.sh $ans $server_name_b
else
	./b.sh $ans
fi
