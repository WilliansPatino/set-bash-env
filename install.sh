#!/bin/bash
#  by W.Patino   30.07.2020 22:42

#  Enable customized bash  environment 
#


update_bash_v2() {
	file=$1

{

	
	echo '# ' >> ~/$file
	echo '#   -- Entorno personalizado para Bash --     '
	echo '# por Willians Patiño, actualizado: 9.2.23   '
	echo ' '
	echo 'CE="customEnv4Bash" '
	echo 'MYCONFIGENV="/opt/$CE/"  '
	echo ' '
	echo 'install_settings() {					       '
	echo '    #--- setting moved outside from homeuser '
	echo '    sudo mv $CE $MYCONFIGENV  			   '
	echo '    echo -e "\nLa configuración del entorno fue instalada" '
	echo '    echo -e "\t $MYCONFIGENV \n "            '
	echo '    # ls /opt -l							   '
	echo '}  '
	echo '   '
	echo 'enable_env() { '
	echo '    if [ -f $MYCONFIGENV/base/config/main.bash ]; then'
	echo '       source  $MYCONFIGENV/base/config/main.bash     '
	echo '    fi   '
	echo '} '
	echo ' '
	echo ' notify_how_install_settings() { '
	echo ' '
	echo '  echo -e "\nCustom config no existe en opt \n-- Recarge los componentes: \n" '
	echo '  echo -e " \tgit clone https://github.com/WilliansPatino/custom-env.git \n"     '
	echo '  echo -e "Compruebe que sea instalado desde la raíz de su directorio "      '
	echo '} '
	echo ' '
	echo 'if [ -d $CE ]; then  ## Does the main dir exit?  '
	echo ' '    
	echo '    install_settings    '
	echo '    enable_env          '
	echo '   '
	echo 'elif [ -d $MYCONFIGENV ] '
	echo '    then       ## Does the main dir exist at /opt  ? '
	echo '        if [ -f $MYCONFIGENV/base/config/main.bash ] # Exist setting at /opt ? '
	echo '        then '
	echo '            enable_env '
	echo '        else '
	echo '            notify_how_install_settings  '
	echo '        fi   '
	echo 'else  '
	echo '    notify_how_install_settings  '
	echo 'fi  '
	echo '#  End update bash  '

	} >> ~/$file
	echo -e "$OK Configuración actualizada en $file "
}	

update_bash_v2 '.bashrc'
# update_bash_v2 '.profile'
update_bash_v2 '.bash_profile'
# update_bash_v2 'UPDATE_BASH.sh'

echo -e "Reinicie la consola de comandos"