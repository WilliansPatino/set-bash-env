#!/bin/bash
CE="customEnv4Bash"
MYCONFIGENV="/opt/$CE/" 

source $MYCONFIGENV/base/styles/setting

echo -e "$BULLET Chequeando paquetes favoritos"
install_debpackages() {
	if [ ! -f `which aptitude` ]; then
		sudo apt install -y aptitude 
	fi
	if [ ! -f `which vim` ]; then
		sudo apt install -y vim
	fi
	if [ ! -f `which neovim` ]; then
		sudo apt install -y neovim
	fi
	if [ ! -f `which tree` ]; then
		sudo apt install -y tree 
	fi
	if [ ! -f `which openssh-server` ]; then
		sudo apt install -y openssh-server
	fi
	# Terminal fonts
	if [ ! -f /var/lib/dpkg/info/xfonts-terminus.list ]; then
		sudo apt install -y xfonts-terminus*
	fi
}
install_rpmpackages() {
		if [ ! -f `rpm -q neovim` ]; then
			sudo dnf install -y neovim
		fi
		if [ ! -f `rpm -q tree` ]; then
			sudo dnf install -y tree 
		fi
		if [ ! -f `rpm -q openssh-server` ]; then
			sudo dnf install -y openssh-server
		fi
		# terminus font
		if [ ! -f `rpm -qa terminus-fonts` ]; then
			sudo dnf install -y terminus-fonts
		fi
}

source $MYCONFIGENV/base/config/identifyOS.sh
check_os

case $os_result in
        "rpm")
			install_rpmpackages
        ;;
        "deb")
            install_debpackages
        ;;
        *)
        echo -e "\n$WARNING No se pude identificar el sistema operativo"
        ;;
esac
