#!/bin/bash


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


. ~/$CE/base/styles/setting 



#echo -e " $AST Detecting architecture"
MACHINETYPE="$(uname -m)";
ARCH="${MACHINETYPE}";
echo -e "$BULLET Architecture: $ARCH";

# identificar OS
check_os() {
    OSNAME=$(grep -E '^(NAME)=' /etc/os-release)

    DEB_TYPE='(Debian|Ubuntu)'
    RPM_TYPE='(Fedora|OpenSuse)'

    echo $OSNAME

    if [[ $OSNAME =~ $DEB_TYPE ]]; then
        echo -e "Derivado de Debian"
        os_result="deb"
    fi

    if [[ $OSNAME =~ $RPM_TYPE ]]; then
            echo -e "Derivado de Red Hat"
        os_result="rpm"

    fi

    msg='Se instalarán'

}


# Directorio principal del entorno de trabajo para Docker
MSA="/msa"  # microservices environment

# Deployments  Docker
DEPLOY="/deployments"

# Custom main dir
CE="custom-env"

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
export GOPATH="$HOME:/Go_workspace"



# systemctl
alias sctlstat='sudo systemctl "$@" status'
alias sctlstop='sudo systemctl "$@" stop'
alias sctlinit='sudo systemctl "$@" start'

# apt 
echo -e ".DEB aptitude Alias: apti, apts, aptd, aptq, aptu "
alias apti='sudo aptitude install "$@"'
alias aptr='sudo aptitude reinstall'
alias apts='aptitude search "$@"'
alias aptd='sudo aptitude remove'
alias aptq='aptitude info "$@" '
alias aptu='sudo aptitude update'

# dnf
echo -e ".RPM DNF Alias: dnfi dnfs dnfr dnfu"
alias dnfi='sudo dnf install "$@"'
alias dnfs='sudo dnf search "$@"'
alias dnfr='sudo dnf remove "$@"'
alias dnfu='sudo dnf update "$@"'


# Docker 
if [ -d /msa/cmt/deploy/micro-LAMP ]; then
   export PATH="$PATH:/msa/cmt/deploy/micro-LAMP/"
fi

# to see diff of this files in my laptop vs desktop/PC
#cmd=$(md5sum ~/$CE/base/config/workshop)
#echo -e "$cmd"

# install my favs apps
# if [ -f ~/$CE/base/pkg/check_apps ]; then
#    bash ~/$CE/base/pkg/check_apps
# fi

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

      echo -e "$WARNING init.vim not found at base.!"

   fi
fi

# prompt
export PS1="\H \t [ \[\e[36;40m\]\w\[\e[m\] ] >  "
export PS1='\[\e[0m\]\t\[\e[m\] \[\e[0m\](\[\e[0;1;38;5;46m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[0m\])\[\e[m\] \[\e[0;38;5;46m\]\w\[\e[m\] \[\e[0m\]\$\[\e[m\] \[\e0'


export PS1='\[\e[0m\][\[\e[0;38;5;47m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[0m\]]\[\e[m\] \[\e[0m\]\t\[\e[m\] \[\e[0;38;5;76m\]\u\[\e[m\] @\h  \n \[\e[0;1;7;38;5;40;48;5;232m\]\w\[\e[m\] \[\e[0m\](\[\e[0m\]\j\[\e[0m\])\[\e[m\] \[\e[0m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[m\] \[\e[m\]\n\[\e[0m\]$ '


# favorite editor
alias st3='~/$CE/ed/sublime_text'  #<--- simple / pre-installed

# Check sublime text (apt install)
if [ "$ARCH" = "amd64" ] || [ "$ARCH" = "i386" ]; then 
	if [ ! -f /opt/sublime_text/sublime_text ]; then
	  sudo bash $HOME/$CE/tools/install_sublime
	  echo -e "$BULLET Sublime text was installed"
	else
	  echo -e "$OK Sublime text is available, can run as 'st3'"
	  export PATH="$PATH:$HOME:/opt/sublime_text/"
	fi
fi

# enable my python packages
#export PYTHONPATH="$HOME/pypkg"
#export JUPYTER_PATH=$PYTHONPATH:$JUPYTER_PATH
#export PATH=$PATH:$PYTHONPATH

echo -e "$BULLET Optional packages can be installed from ~/$CE/base/pkg"

# instalar pkg de acuerdo a la distro
install_package() {

    check_os

    pkg1=$1
    pkg2=$2
    pkg3=$3

     msg='Se instalarán'
    case $os_result in
        'rpm')
            echo -e "$msg paquetes RPM \n"
            sudo dnf install -y $pkg1 $pkg2 $pkg3
        ;;
        'deb')
            echo -e "$msg paquetes DEB "
            sudo aptitude install -y $pkg1 $pkg2 $pkg3
        ;;
        *)
        echo -e "\nNo se pude identificar el sistema operativo"
        ;;
    esac
}

set_environment() {

    check_os

    case $os_result in
        'rpm')
         echo -e "Configurado entorno Bash Derivados Red Hat\n"
         . /usr/share/powerline/bash/powerline.sh
        ;;
        'deb')
            echo -e "Configurado entorno Bash Derivados Debian\n"
            . /usr/share/powerline/bindings/bash/powerline.sh 

        ;;
        *)
        echo -e "\nNo se pude identificar el sistema operativo"
        ;;
    esac
}

# Customized bash prompt
enable_powerline() {
     powerline-daemon -q
     POWERLINE_BASH_CONTINUATION=1
     POWERLINE_BASH_SELECT=1

   set_environment

     # rpm 
     #. /usr/share/powerline/bash/powerline.sh
     # deb
   #  . /usr/share/powerline/bindings/bash/powerline.sh 

}


if [ ! -f `whereis powerline-daemon` ]; then
   echo 'Powerline no esta instalado'

   install_package 'powerline' 'fonts-powerline' 'powerline-fonts'

   # sudo dnf install -y powerline powerline-fonts

   echo -e "Reinicie la consola para aplicar los cambios"
else
   enable_powerline
fi

