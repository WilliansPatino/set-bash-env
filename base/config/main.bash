#!/bin/bash


# Directorio principal del entorno de trabajo para Docker
MSA="/my-containers"  # microservices environment

# Deployments  Docker
DEPLOY="/deployments"

# Customized bash dir 
CE="custom-env"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

. ~/$CE/base/styles/setting 

source ~/$CE/base/config/identifyOS.sh



# install my favorite apps
# if [ -f ~/$CE/base/pkg/check_apps ]; then
#     bash ~/$CE/base/pkg/check_apps
# fi



# todos mis scripts para simplificar tareas
if [ -d "$HOME/_myscripts" ] ; then
    export PATH="$PATH:$HOME/_myscripts"
fi


# lo mismo pero con algunos retoques
alias ll='clear && ls -lFh'
alias la='clear && ls -a'
alias l='clear && ls -lCFGh'
#alias vimg='vim.gtk'
#alias vi='nvim'
alias ..='cd ..'

# gestion rapida de containers, stop, start, remove
if [ -d "$DEPLOY/manage" ] ; then
   export PATH="$PATH:$DEPLOY/manage"
fi

# mi area de trabajo docker
#if [ -d "$MSA/cmt/" ] ; then
#   PATH="$PATH:$MSA/cmt"
#fi


#  entorno de Programacion Go
export PATH=$PATH:/usr/local/go/bin
export GOPATH="$HOME:/Go-workspace"



# systemctl
echo -e "(systemctl) Alias:  [ status: stlstat <s>, stop: stlstop <s>, start: stlini  <s> ]"
alias stlstat='sudo systemctl "$@" status'
alias stlstop='sudo systemctl "$@" stop'
alias stlsini='sudo systemctl "$@" start'

alias_apt() {

    # apt 
    echo -e "(apt) Alias: apti, apts, aptd, aptq, aptu "
    alias apti='sudo aptitude install "$@"'
    alias aptr='sudo aptitude reinstall'
    alias apts='aptitude search "$@"'
    alias aptd='sudo aptitude remove'
    alias aptq='aptitude info "$@" '
    alias aptu='sudo aptitude update'
}

alias_dnf() {

    # dnf
    echo -e "(dnf) Alias: dnfi dnfs dnfr dnfu"
    alias dnfi='sudo dnf install "$@"'
    alias dnfs='sudo dnf search "$@"'
    alias dnfr='sudo dnf remove "$@"'
    alias dnfu='sudo dnf update "$@"'

}

# Docker 
if [ -d /msa/cmt/deploy/micro-LAMP ]; then
   export PATH="$PATH:/msa/cmt/deploy/micro-LAMP/"
fi




# my scripts ready to use it
export PATH="$PATH:$HOME/$CE/base/scripts"


# enable .vimrc
if [ -f ~/.vimrc ]; then
   echo -e "$BULLET.vimrc is enabled"
else
   if [ -f ~/$CE/base/config/vimrc ]; then
      ln -s ~/$CE/base/config/vimrc .vimrc
      echo -e "$BULLET .vimrc has been enabled"
   else
      echo -e "$ALERT .vimrc not found!"
   fi
fi



# vim setting 
link_vim() {

    if [ ! -f ~/.vim/vimrc ]; then
       ln -s ~/$CE/base/config/vimrc ~/.vim/vimrc
        echo -e "$BULLET .vim/vimrc enabled!" 
    fi
}

link_autoload() {

    if [ ! -d ~/.vim/autoload ]; then
	   ln -s ~/$CE/base/config/autoload ~/.vim/autoload
           echo -e "$OK .vim/autoload enabled" 
    fi
}
link_plugged() {

    if [ ! -d ~/.vim/plugged ]; then
	#ln -s ~/$CE/base/config/plugged ~/.vim/plugged
        mkdir ~/.vim/plugged
        echo -e "$BULLET  Directory '.vim/plugged' created" 
    fi
}

link_all() {
   link_vim
   link_autoload
   link_plugged
}


if [ ! -d ~/.vim ]; then
   mkdir -p ~/.vim
   echo -e "$OK ~/.vim creado!"
   link_all
fi
#--- end vim setup


# enable .config/nvim/init.vim
link_initvim() {

   ln -s ~/$CE/base/config/init.vim  ~/.config/nvim/init.vim
}

if [ -f ~/.config/nvim/init.vim ]; then


   echo -e "$BULLET init.vim for neovim enabled"
else
   # does init.vim exist?
   if [ -f ~/$CE/base/config/init.vim ]; then
      # does the config dir exist? 
      if [ ! -d ~/.config/nvim ]; then
	      mkdir -p ~/.config/nvim
              link_initvim

      else 
	 link_initvim
      fi

   else

      echo -e "$WARNING init.vim not found in config"

   fi
fi




echo -e "$BULLET Instale algunos paquetes favoritos con este:  ~/$CE/base/pkg/install-fav.sh"

# instalar pkg de acuerdo a la distro
install_package() {

    check_os  # identify operating systems; 

    pkg1=$1
    pkg2=$2
    pkg3=$3

    echo -e "Se actualizarán los paquetes: $pkg1 $pkg2 $pkg3 "


     msg='Se instalarán'
    case $os_result in
        "rpm")
            echo -e "$msg paquetes RPM \n"
            sudo dnf install -y $pkg1 $pkg2 $pkg3
        ;;
        "deb")
            echo -e "$msg paquetes DEB "
            sudo aptitude install -y $pkg1 $pkg2 $pkg3
        ;;
        *)
        echo -e "\nNo se pude identificar el sistema operativo"
        ;;
    esac

    echo 'End install...'
}

isInstalled() {

    check_os


    case $os_result in
        "rpm")

        if [ `rpm -q $1` ]; then
            echo -e "$OK Powerline installed"
        else
             echo "NO INSTALADO"
            install_package powerline powerline-fonts
        fi
        ;;
        "deb")
        #    if [  `dpkg -s $1` ]; then
           if [ -f  `which powerline` ]; then
            echo -e "$OK Powerline installed"
        else 
            echo "NO INSTALADO"
            install_package powerline fonts-powerline
        fi

        ;;
        *)
        echo -e "\nNo se pude identificar el sistema operativo"
        ;;
    esac
}

isInstalled powerline

set_environment() {

    check_os

    active="false"

    # msg="$BULLET Activado el prompt Powerline según "
    case $os_result in
        "rpm")
         echo -e "$msg $RPM_TYPE"
         . /usr/share/powerline/bash/powerline.sh
         active="true"
         alias_dnf

        ;;
        "deb")
            echo -e "$msg $DEB_TYPE"

            if [ -f  /usr/share/powerline/bindings/bash/powerline.sh ]; then
                source /usr/share/powerline/bindings/bash/powerline.sh 
                active="true"
            else 
                active="false"
            fi
            alias_apt
        ;;
        *)
        echo -e "\nNo se pude identificar el sistema operativo"
        ;;
    esac

    if [  $active == "false" ]; then
        echo -e "$WARNING Inicio de Powerline prompt falló "
    fi

}

# Customized bash prompt
enable_powerline() {
     powerline-daemon -q
     POWERLINE_BASH_CONTINUATION=1
     POWERLINE_BASH_SELECT=1

   set_environment

}



if [  -f `which powerline` ]; then
   enable_powerline

else 
   echo 'Powerline no esta instalado'

fi

enable_browsersync() {
    REMOTE_IP="10.42.0.1"
    alias browsersync="browser-sync start -s -f . --no-notify --host $REMOTE_IP --port 9000 -w "
    echo -e "$BULLET Inicia Web Server en tu proyecto, ejecutando:  browsersync
                local: http://localhost:9000
                Remote: http://$REMOTE_IP:9000
    "
    export REMOTE_IP
}
# --- Browser sync // Web Server basado en node 
if [ ! -f `which browser-sync` ]; then
    echo 'browser-sync no esta instalado'

    sudo npm install -g npm@9.4.0
    sudo npm install -g browser-sync
else
    echo -e "$OK browser-sync instalado"
    enable_browsersync
fi

