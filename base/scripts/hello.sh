#!/bin/sh

# source shflags from current directory
#. ./shflags

# define a 'name' command-line string flag
DEFINE_string 'name' 'world' 'name to say hello to' 'n'

# parse the command-line
FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"

# say hello
echo "Hello, ${FLAGS_name}!"