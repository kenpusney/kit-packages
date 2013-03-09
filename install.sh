#!/bin/bash


for packdir in plugins lib bin
do
    [ -d $packdir ] && cp -rf $packdir ~/.kit
done

cp github.cfg ~/.kit
