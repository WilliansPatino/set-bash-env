#!/bin/bash

#  clonar disco

PATHFROM=$1
PATHTO=$2
DIRNAME=$3

SIZEFROM=$(du -sb $PATHFROM/$DIRNAME | awk '{print $1}')
SIZETO=$(du -sb $PATHTO | awk '{print $1}')
echo -e "Argumentos;  Ruta-origen  Ruta-destino DirName\n\n"
echo -e "(1) Origen: $PATHFROM/$DIRNAME \n(2) Destino: $PATHTO/$DIRNAME\n"
echo -e " Si esta de acuerdo con los argumentos, espere un momento. De lo contrario CTRL-C"
sleep 5
echo -e " Copiar directorio en otro disco"
echo -e "Tamaño del origen: $SIZEFROM  y Tamaño del destino: $SIZETO"
echo -e " Si esta de acuerdo, espere un momento. De lo contrario CTRL-C"
sleep 3
#sudo dd if=$SOURCE conv=sync,noerror bs=10M status=progress \
rsync -az $PATHFROM/$DIRNAME $PATHTO | pv -lep -s $SIZEFROM > /dev/null

