#!/bin/bash

# by Willians Patino, 2020, Feb

# watch disks usage

watch -d df -m --type={ext4,vfat,fuse,ext3i,iso8660,fuseblk} 
