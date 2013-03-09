#!/bin/bash
##
## kit string lib
## @author : Kimmy Leo
##

load_lib "error"
##
## strlen : calc the length of the string.
## @usage : strlen <string>
##
strlen(){
    [ $# -ne 1 ] && error "Unknown number of arguments."
    len=`echo "$1" | wc -c`
    let len=$(($len-1))
    echo "$len"
}
