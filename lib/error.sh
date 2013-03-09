#!/usr/bin/env bash

##
## kit error lib
## @author : Kimmy Leo<kenpusney@gmail.com>
##

error() {
    printf "$1\n\n" 
    printf "See \`kit --help\` for more information.\n"
    exit 1;
}
