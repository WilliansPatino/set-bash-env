#!/bin/bash 
#
# por W.Patino
#
path=$1
user=$2

echo -e "Input Samba-path and user"
adduser --home $path --no-create-home $user
sleep 5
echo -e "Input samba password"
smbpasswd -a $user
chown root:$user $path
