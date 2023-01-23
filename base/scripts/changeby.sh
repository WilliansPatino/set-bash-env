#!/bin/bash

# edit file from console

oldString=$1
newString=$2
file=$3
echo $1 $2 $file


echo "s/$oldString/$newString/"

echo -e "Before..."

egrep -e "$oldString" $file

# objetive
sed -i "s/$oldString/$newString/g" $file

echo -e "change done"
egrep -e "$newString" $file
