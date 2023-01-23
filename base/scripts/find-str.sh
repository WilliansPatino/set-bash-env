#!/bin/bash
#               W.Patino, 21.07.2020, 11h35
#
#    simple tool for files searching

. ~/_myconfig/colors/setting 

#pathdir='/tmp'   # default limit searching 
#string='tmp*'

#-------------------------- M E N U -----------------------------------
helpFunction () {
   echo -e "$usage\n"
   exit 1 # Exit script after printing help
}

parametersEmpty () {
   #echo "Some or all of the parameters are empty";
   #md5=$(md5sum "$0")
   #bas=$(basename "$0")
   #echo -e "$md5 "
   #echo -e "$cmd"
  echo -e "$(basename "$0"):  $YELLOW Complete la entrada de los parámetros  $RST -h Help"
  exit 1
}

usage="$GREEN$(basename "$0") v1.0.1, 2020.07.21, by W.Patiño <ppwj@yahoo.com> $RST

  Uso:  [ OPCIONES] -h  -t <string> -d <path directory>

Buscar archivos que contengan una cadena de texto.

  -h                 Muestra este texto de ayuda
  -s                 <string>  
  -d                 Directorio
  
"

while getopts d:s:h option; do
case "${option}" in
     s) string=${OPTARG};;
	 d) pathdir=${OPTARG};;
     h) helpFunction;;
     :) printf "illegal" $OPTARG >&2    
     echo -e $usage >&2;;
esac
done
#----- EOF  M E N U 

# valida argumentos
if [ -z "$string" ] || [ -z "$pathdir" ];
then
  parametersEmpty
fi

#  search
find $pathdir -type f | xargs grep -l -H "$string" 
#| xargs  grep $string {}
