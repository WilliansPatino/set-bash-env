#!/bin/bash

#  Willians Patino, 21.04.2020, 9h51

# help for bash scripting

#echo -e "Help for bash scripting"

if [ "$1" == "-h" ]; then
  echo "tUso: `basename $0` [somestuff]"
  exit 0
fi