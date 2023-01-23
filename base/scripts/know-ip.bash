#!/bin/bash

# server_ip="192.168.250.5"
server_ip= $hostname -I | awk '{print $1}'

echo $server_ip

