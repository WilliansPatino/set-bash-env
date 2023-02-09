#!/bin/bash


# Customized bash dir 
CE="customEnv4Bash"
MYCONFIGENV="/opt/$CE/" 

source $MYCONFIGENV/base/styles/setting 


# identificar OS
check_os() {

    MACHINETYPE="$(uname -m)";
    ARCH="${MACHINETYPE}";

    DEB_TYPE='(Debian|Ubuntu|Mint|Parrot)'
    RPM_TYPE='(Fedora|OpenSuse|RedHat)'


    OSNAME=$(grep -E '^(NAME)=' /etc/os-release)

    OS_FOUND="OS Found:  $OSNAME / $ARCH"

    export OS_FOUND



    if [[ $OSNAME =~ $DEB_TYPE ]]; then
        # echo -e "Derivado de Debian"
        os_result="deb"
    fi

    if [[ $OSNAME =~ $RPM_TYPE ]]; then
            # echo -e "Derivado de Red Hat"
        os_result="rpm"
    fi

}
