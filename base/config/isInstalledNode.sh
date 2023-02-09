#!/bin/bash


# Customized bash dir 
CE="customEnv4Bash"
MYCONFIGENV="/opt/$CE/"  

source $MYCONFIGENV/base/styles/setting 


# identificar OS
check_NODEJS() {

     found_nodejs="null"

    VERSIONSNODEJS='(v18|v16|v15|v14)'

    if ! node -v  &> /dev/null
    then
        echo -e "Node JS no se encontró instalado"
        found_nodejs="false"

        return 0
    else 
        NODEVERSION="$(node -v)";
        NODEJS_VERSION_FOUND="NODE JS $NODEVERSION"
        echo -e "$OK node — server-side JavaScript runtime $NODEVERSION "
    fi


    if [[ $NODEVERSION =~ $VERSIONSNODEJS ]]; then
        found_nodejs="true"
        # echo -e " Encontrado $NODEJS_VERSION_FOUND"
    fi

    # npm manager
    if ! npm -v  &> /dev/null
        then
            echo -e "npm  no se encontró instalado"
            found_nodejs="false"
            exit 
    else 
        NPMVERSION="$(npm -v)";
        echo -e "$OK npm - javascript package manager está instalado $NPMVERSION"
        fi

}



check_NODEJS

export  found_nodejs
# echo $found_nodejs
