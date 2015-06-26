#!/bin/bash
#Check if user provided the filename or not
if [ "$1" == "" ]; then 
  echo "Usage: command filename "
  exit 1
fi
#Check if file exists or not
if [ ! -f "$1" ]; then
  echo "The file $1 does not exists."
  exit 2
fi
#Parse the file
echo "Parsing log file: $1"
echo 'Following request took longest time:'
echo -e "time:\trequest:"
cat $1 | grep 'Completed' | cut -d \( -f 1 | awk '{ print substr($NF,0,length($NF)-2),$1 }' | sort -rn | head -1
exit 0
