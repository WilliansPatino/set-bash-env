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

Remover de los siguientes archivos:
    - .bashrc
    - .profile
    - .bash_profile

esta parte del código: 





```

```

