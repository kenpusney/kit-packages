#!/usr/bin/env bash

uxa_curdir=`pwd`

cd $curdir

for file in `ls`
do
    chmod -x $file
done

cd $uxa_curdir
