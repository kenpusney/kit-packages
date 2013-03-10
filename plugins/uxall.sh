#!/usr/bin/env bash

uxa_curdir=`pwd`

cd $curdir
[ $# -gt 0 ] && ext="$@" || ext=""
for file in `ls $ext`
do
    chmod -x $file
done

cd $uxa_curdir
