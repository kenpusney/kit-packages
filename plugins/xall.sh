#!/usr/bin/env bash

xa_curdir=`pwd`

cd $curdir

for file in `ls`
do
    chmod +x $file
done

cd $xa_curdir
