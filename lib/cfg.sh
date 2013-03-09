#!/usr/bin/env bash

##
## kit cfg lib
## @author : Kimmy Leo<kenpusney@gmail.com>
## @require : `sed`
##ls

load_lib "error"

get_cfg(){
    [ $# -ne 2 ] && error "[Error] \`get_cfg\` need 2 arguments, but $# given."
    [ -e $2 ] || error "[Error] in \`get_cfg\`: cannot found \`$2\` file."
    echo "`sed -n "s/$1=\\([^:]*\\)/\\1/p" $2`"
}

