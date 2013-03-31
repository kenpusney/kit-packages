#!/usr/bin/env bash

##
##    M4-based LISP Implementation
##

if [ $# -eq 0 ]
then
    m4 -Ilib
fi

case $1 in
    --help | help | -h | usage )
        ;;
    *   )
        [ -e $1 ] || m4 -Ilib $1
        [ -e "$curdir/$1" ] || m4 -Ilib "$curdir/$1"
        ;;
esac
