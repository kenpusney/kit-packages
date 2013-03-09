#!/usr/bin/env bash

##
## kit github lib
## @author : Kimmy Leo<kenpusney@gmail.com>
## @require : `git` && `curl`
##


gh_raw(){
    if [ -e github.cfg ] 
    then
        user=`sed -n "s/user=\\([^:]*\\)/\\1/p" github.cfg`
        repo=`sed -n "s/repo=\\([^:]*\\)/\\1/p" github.cfg`
        branch=`sed -n "s/branch=\\([^:]*\\)/\\1/p" github.cfg`
    elif [ $# -eq 3 ]
    then
        user="$1"
        repo="$2"
        branch="$3"
    else
        user="kenpusney"
        repo="kit-packages"
        branch="master"
    fi
    echo "https://raw.github.com/$user/$repo/$branch/"
}

