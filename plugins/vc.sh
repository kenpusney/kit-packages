#!/usr/bin/env bash




[ $# -eq 0 ] && exit ;

TMP="/tmp/cview.tmp.$1";

enca -L zh -x UTF-8 < $1 > $TMP

vi $TMP
