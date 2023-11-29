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
- Muestra el entorno virtualenv de Python actual.  [virtualenv](http://www.virtualenv.org/) 
- Es fácil de personalizar y ampliar. Vea a continuación para más detalles.

- Shows some important details about the git/svn/hg/fossil branch (see below)
- Changes color if the last command exited with a failure code
- If you're too deep into a directory tree, shortens the displayed path with an ellipsis
- Shows the current Python [virtualenv](http://www.virtualenv.org/) environment
- It's easy to customize and extend. See below for details.






## Setup

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

- Install using pip:

```
pip install powerline-shell
```

(*You can use the
[`--user`](https://pip.pypa.io/en/stable/user_guide/#user-installs) option to
install for just your user, if you'd like. But you may need to fiddle with your
`PATH` to get this working properly.*)

- Or, install from the git repository:

```
git clone https://github.com/b-ryan/powerline-shell
cd powerline-shell
python setup.py install
```

- Setup your shell prompt using the instructions for your shell below.

### Bash

Add the following to your `.bashrc` file:

```
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
```

**Note:** On macOS, you must add this to one of `.bash_profile`, `.bash_login`,
or `.profile`. macOS will execute the files in the aforementioned order and
will stop execution at the first file it finds. For more information on the
order of precedence, see the section **INVOCATION** in `man bash`.




## Personalización

### Config File

Powerline-shell is customizable through the use of a config file. This file is
expected to be located at `~/.config/powerline-shell/config.json`. You can
generate the default config at this location using:

```
mkdir -p ~/.config/powerline-shell && \
powerline-shell --generate-config > ~/.config/powerline-shell/config.json
```

(As an example, my config file is located here:
[here](https://github.com/b-ryan/dotfiles/blob/master/home/config/powerline-shell/config.json))

### Ajustes

Debian

error: 

  -bash: /usr/share/powerline/bash/powerline.sh: No existe el fichero o el directorio

solucion: 

 /usr/share/powerline/bindings/bash/powerline.sh 


There are two special segments available. `stdout` accepts an arbitrary command
and the output of the command will be put into your prompt. `env` takes an
environment variable and the value of the variable will be set in your prompt.
For example, your config could look like this:

```
{
  "segments": [
    "cwd",
    "git",
    {
      "type": "stdout",
      "command": ["echo", "hi"],
      "fg_color": 22,
      "bg_color": 161
    },
    {
      "type": "env",
      "var": "DOCKER_MACHINE_NAME"
    },
  ]
}
```

### Temas

The `powerline_shell/themes` directory stores themes for your prompt, which are
basically color values used by segments. The `default.py` defines a default
theme which can be used standalone, and every other theme falls back to it if
they miss colors for any segments.

If you want to create a custom theme, start by copying one of the existing
themes, like the
[basic](https://github.com/b-ryan/powerline-shell/blob/master/powerline_shell/themes/basic.py).
and update your `~/.config/powerline-shell/config.json`, setting the `"theme"`
to the path of the file. For example your configuration might have:

```
  "theme": "~/mythemes/my-great-theme.py"
```

You can then modify the color codes to your liking. Theme colors are specified
using [Xterm-256 color codes](https://jonasjacek.github.io/colors/).

A script for testing color combinations is provided at `colortest.py`. Note
that the colors you see may vary depending on your terminal. When designing a
theme, please test your theme on multiple terminals, especially with default
settings.


