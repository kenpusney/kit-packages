#!/usr/bin/env bash

xa_curdir=`pwd`

cd $curdir
[ $# -gt 0 ] && ext="$@" || ext=""
for file in `ls $ext`
do
## FIXME: Error if directories
    chmod +x $file
done

cd $xa_curdir
