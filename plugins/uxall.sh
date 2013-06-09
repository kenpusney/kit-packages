#!/usr/bin/env bash

uxa_curdir=`pwd`

cd $CURDIR
[ $# -gt 0 ] && ext="$@" || ext=""
for file in `ls $ext`
do
## FIXME: error if directories
    [ -d $file ] || chmod -x $file
done

cd $uxa_curdir
