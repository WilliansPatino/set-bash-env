# Entorno bash personalizado 

Accesos, prompt e instalación automática de paquetes


## Descargar en el PC

    git clone https://github.com/WilliansPatino/set-bash-env.git

##  Habilitar en el Bash

    bash set-bash-env/install.sh



## Vista previa del prompt


![MacVim+Solarized+Powerline+CtrlP](https://raw.github.com/b-ryan/powerline-shell/master/bash-powerline-screenshot.png)

## Prestaciones del Powerline configurado para el entorno bash

- Muestra algunos detalles importantes sobre la rama git/svn/hg/fossil (ver más abajo)
- Cambia de color si el último comando salió con un código de error
- Si está demasiado metido en un árbol de directorios, acorte la ruta mostrada con puntos suspensivos
- Muestra el entorno [virtualenv](http://www.virtualenv.org/)  de Python actual. 
- Es fácil de personalizar y ampliar. Vea a continuación para más detalles.


## Configuración de Powerline

This script uses ANSI color codes to display colors in a terminal. These are
notoriously non-portable, so may not work for you out of the box, but try
setting your $TERM to `xterm-256color`.

- Patch the font you use for your terminal: see
  [powerline-fonts](https://github.com/Lokaltog/powerline-fonts)
  - If you struggle too much to get working fonts in your terminal, you can use
    "compatible" mode.
  - If you're using old patched fonts, you have to use the older symbols.
    Basically reverse [this
    commit](https://github.com/milkbikis/powerline-shell/commit/2a84ecc) in
    your copy.

- Instalación usando pip:

```
pip install powerline-shell
```

- o desde el repositorio Git:

```
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
```

- Configure su indicador de shell siguiendo las instrucciones para su shell a continuación.

### Cómo desabilitar la ejecución de este entorno personalizado

Remover esta parte de código en los archivos mencionados a continuación a pie de página.

```

#   -- Entorno personalizado para Bash --     
# por Willians Patiño, actualizado: 9.2.23   
 
CE="set-bash-env" 
MYCONFIGENV="/opt/$CE/"  
 
install_settings() {					       
    #--- setting moved outside from homeuser 
    sudo mv $CE $MYCONFIGENV  			   
    echo -e "\nLa configuración del entorno fue instalada" 
    echo -e "\t $MYCONFIGENV \n "            
    # ls /opt -l							   
}  
   
enable_env() { 
    if [ -f $MYCONFIGENV/base/config/main.bash ]; then
       source  $MYCONFIGENV/base/config/main.bash     
    fi   
} 
 
 notify_how_install_settings() { 
 
  echo -e "\nCustom config no existe en opt \n-- Recarge los componentes: \n" 
  echo -e " \tgit clone https://github.com/WilliansPatino/set-bash-env.git \n"     
  echo -e "Compruebe que sea instalado desde la raíz de su directorio "      
} 
 
if [ -d $CE ]; then  ## Does the main dir exit?  
 
    install_settings    
    enable_env          
   
elif [ -d $MYCONFIGENV ] 
    then       ## Does the main dir exist at /opt  ? 
        if [ -f $MYCONFIGENV/base/config/main.bash ] # Exist setting at /opt ? 
        then 
            enable_env 
        else 
            notify_how_install_settings  
        fi   
else  
    notify_how_install_settings  
fi  
#  End update bash  

```

###  Archivos que habilitan el entorno personalizado


- .bashrc
- .profile
- .bash_profile







```

```

