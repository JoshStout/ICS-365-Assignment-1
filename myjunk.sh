#!/bin/bash

#Utility: myjunk -lp { file Name } *
#Script is a replacement for the rm utility: Specified files are moved to the junk directory.

#Test for no arguments. If no arguments given, exit script.
if [ "$#" -eq 0 ]
then
	echo "Usage: myjunk {file name or option}"
	exit
fi

#Check if junk directory exist and make directory if not.
if [ ! -d ~/junk ]
then
	mkdir ~/junk
fi

#Option -l list all contents under junk directory.
if [[ $1 == "-l" ]]
then
	ls -l ~/junk

#Option -p purges the contents under junk directory.
elif [[ $1 == "-p" ]]
then
	for file in ~/junk/*
		do
			rm "$file"
		done

#Must be a filename if script got this far.
else
	#Loop thru each filename in argument and check if file exist.
	while [ "$#" -ne 0 ]
		do
			if [ -f "$1" ]
			then
				#Move file to junk directory.
				mv "$1" ~/junk
			else
				echo "File-name-error: File $1 cannot be found."
			fi
			shift
		done
fi
