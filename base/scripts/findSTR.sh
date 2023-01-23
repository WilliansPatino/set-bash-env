#!/bin/bash
#               W.Patino, 21.07.2020, 11h35
#
#    simple tool for files searching

. ~/_myconfig/colors/setting 


#-------------------------- M E N U -----------------------------------
#



helpFunction () {
   echo -e "$usage\n"
   exit 1 # Exit script after printing help
}

parametersEmpty () {
   #echo "Some or all of the parameters are empty";
   md5=$(md5sum "$0")
   #bas=$(basename "$0")
   echo -e "$md5 "
   #echo -e "$cmd"
  echo -e "$(basename "$0"):  $YELLOW Algún parámetro o todos pueden están vacíos $RST -h Help"
  exit 1
}

usage="$GREEN$(basename "$0") v3.35.1, 2020.05.21, by W.Patiño <ppwj@yahoo.com> $RST

  Uso:  [ OPCIONES] -h   

Crear container basado en WordPress, MariaDB y Apache.

  -h                 Muestra este texto de ayuda
  -t                 Modo TESTING   (true or false)    
  -n  container      Nombre del container (default: ${container_name})
  -d  dominio        Dominio de internet  (default:  $domain)
  -i  ip address     IP del servidor hosting (default: $server_ip)
  -w  puerto         Puerto público para Wordpress (default: $pub_webport)  
  -m  puerto         Puerto público para MariaDB   (default: $pub_dbaseprt)
  -U                 MariaDB usuario Wordpress  (default: $dbpass) 
                        $BULLET created a new password at runtime 
  -R                 MariaDB root admin password (default: $root_pass)
                        $BULLET created a new password at runtime 
  -S                 Inicie el servidor web con HTTPS / SSL(default: $include_ssl)
  -F                 Forzar reinstalación   (default: false)
  -C                 Forzar la creación de certificados   (default: $recreateCerts)
  -L                 Publicar HTTP   (default: $isPublicHTTP)


Remote admin user: $BULLET Will be created at runtime (default)
DB Management: $dbservice

"
   #  $INFO: Public FTP access admin $RESET   (default: $pub_ftpport)


while getopts n:d:i:t:w:m:U:R:S:F:C:L:h option; do
case "${option}" in
     n) container_name=${OPTARG};;
     d) domain=${OPTARG};;
     i) server_ip=${OPTARG};;
     t) isTesting=${OPTARG};;
     w) pub_webport=${OPTARG};;
     m) pub_dbaseprt=${OPTARG};;
     U) dbpass=${OPTARG};;
     R) root_pass=${OPTARG};;
     S) include_ssl=${OPTARG};;
     F) force_installation=${OPTARG};;
     C) recreateCerts=${OPTARG};;
     L) isPublicHTTP=${OPTARG};;
     h) helpFunction;;
     :) printf "illegal" $OPTARG >&2    
     echo -e $usage >&2;;
esac
done
#----- EOF  M E N U 

find $1 -type f | xargs grep -l -H "$2" | xargs  grep $2 {}
