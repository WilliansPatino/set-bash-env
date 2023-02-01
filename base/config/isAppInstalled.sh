#!/usr/bin/bash

#  


is_app_installed() {

    app=$1
    app_installed="null"


    
    # echo -e "Verificando $app"
    if ! $app --version  &> /dev/null
        then
            echo -e "$app no se encontró instalado"
            app_installed="false"
            return 0
        else 
            APPVERSION="$($app --version)"
            echo -e "$OK $app está instalada ($APPVERSION ) "
            app_installed="true"
            
    fi



}
export  app_installed
