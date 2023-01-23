#!/bin/bash

useradd -M -s /sbin/login $1 
smbpasswd -a $1  
