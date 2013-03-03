#!/bin/bash


for packdir in plugins scripts libs
do
    [ -d $packdir ] && cp -rf $packdir ~/.kit
done
