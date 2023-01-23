#!/bin/bash
#  by W.Patino   30.07.2020 22:42

#  Enable customized bash  environment 
#

CE="custom-env"

if [ -f ~/$CE ]; then 
	. ~/$CE/base/styles/setting
fi

update_bash() {
	file=$1
{
  	echo '#--- ' >> ~/$file
	echo '# Customized environment - https://github.com/WilliansPatino '
	echo ' '
	echo 'CE="custom-env" '
	echo 'link=".bash-personalizado" '
	echo 'link_env() { '
	echo '   if [ -d ~/$CE ]; then'   ## directorio descargado github
	echo ' echo -e "Directorio de config: $CE  $link "'
	
	echo '	      if [ ! -L $link ]; then'
	echo '             echo -e " Enlace $link creado" '
	echo '	    	   ln -s ~/$CE/base ~/$link'  
	echo '		   fi '
	echo '    else '
	echo '    	  echo -e " $CE No encontrado " '
	echo '    fi'
	# echo '   source  ~/$CE/$link/config/main.bash'
	echo ' if [ -L $link ]; then '
	echo '   source  ~/$link/config/main.bash'
	echo '   echo -e "Customized environment enabled" '
	echo ' else '
	echo '    echo -e  "No existe el enlace $link " '
	echo ' fi '
	echo ' '
	echo '}'
	echo ' '
	# echo 'if [ -f ~/$CE/base/config/workshop ]; then'
	echo 'if [ -f ~/$CE/base/config/main.bash ]; then'
	echo '	link_env'
	echo 'else'
	echo '	echo -e "Configuración principal no encontrada" '
	echo '	echo -e "Compruebe que existe el directorio: $link " '
	echo '	echo -e "\nSe imprime listado del directorio raiz\n" '
	echo '  ls ~/'
	echo ' '
	echo 'fi '

} >> ~/$file
echo -e "$OK $file updated!"
echo -e "Reinicie la consola de comandos"

}

update_bash '.bashrc'
update_bash '.profile'
update_bash '.bash_profile'
