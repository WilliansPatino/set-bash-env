#!/bin/bash

#This script is free to modify and distribute.
#Use at your own risk.

#Requirement: xmms-infopipe

#User Settings here
maxcol=35
file=/tmp/xmms-info

#Grab needed information
pos=`cat $file | grep uSecPosition: | cut -d : -f2`
len=`cat $file | grep uSecTime: | cut -d : -f2`

#Count the length in characters of the title
size=`echo $title | wc -c`
#Calculate current position within that length
poscol=$(echo "$pos*$maxcol/$len" | bc)

#Printing
for (( i=0; i<$maxcol; i++ ))
do
  if [ $i -eq $poscol ]; then
    echo -n 'O'
  else
    echo -n '='
  fi
done
