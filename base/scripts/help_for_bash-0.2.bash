#!/bin/bash

#  Willians Patino, 21.04.2020, 9h51

# help for bash scripting


usage="Programa para crear containers

\e[32m Uso: $(basename "$0")   [-h] [-s n] \e[0m 

donde:
    -h  show this help text
    -s  set the seed value (default: 42)"

seed=42
while getopts ':hs:' option; do
  case "$option" in
    h) echo -e "\t\e[32m $usage \e[0m\n"
       exit
       ;;
    s) seed=$OPTARG
       ;;
    :) printf "\t\e[31m missing argument for -%s \e[0m \n" "$OPTARG" >&2
       echo -e "$usage" >&2
       exit 1
       ;;
   \?) printf "\t\e[31m illegal option: -%s  \e[0m \n" "$OPTARG" >&2
       echo -e "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))
