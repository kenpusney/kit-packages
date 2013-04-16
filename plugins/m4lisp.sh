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
        [ -e "$CURDIR/$1" ] || m4 -Ilib "$CURDIR/$1"
        ;;
esac
