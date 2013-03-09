#!/usr/bin/env bash

##
## kit conf plugin
## @author : kimmy leo
## @require : none
##

##
## cover_conf : Cover configuration files to local.
## @usage : cover_conf <files>
##
cover_conf() {
    for cfg in $@
    do
        case $cfg in
            "all" )
                echo "Covering all configurations, please wait ..."
                sed -n 's/[^:]*:\([^:]*\):\([^:]*\)/cp -rf \2 \1/p' konf.lst | bash 
                echo "done!" ;;
            * ) 
                #exprs="s/$cfg:\\([^:]*\\):\\([^:]*\\)/cp -rf \\2 \\1/p"
                echo "Cover \`$cfg\` configuration ..."
                [ -f "`sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/\\2/p" konf.lst`" ] || error "[Error] Cannot found conf: \`$cfg\`. "
                sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/cp -rf \\2 \\1/p" konf.lst | bash 
                echo "done!" ;;
        esac
    done
}

##
## insert_conf : Insert a new configuration item into konf.lst.
## @usage : insert_conf <name> <local_path> <file>
##
insert_conf(){
    
    [ -f $2 ] || error "[Error] Cannot found \`$2\`."
    [ -e $3 ] && error "[Error] \`$3\` already exists."

    echo "Copying files ..." && cp -rf $2 $3
    echo "Appending records ..." && [ -e $3 ] && echo "$1:$2:$3" >> konf.lst
    [ -e $3 ] && echo "\`$1\` has inserted to conf. "
}

##
## backup_conf : Backup conf from local to konfig.
## @usage : backup_conf <files>
##
backup_conf() {
    for cfg in $@
    do
        case $cfg in
            "all" )
                echo "Backing-up all configurations, please wait ..."
                sed -n 's/[^:]*:\([^:]*\):\([^:]*\)/cp -rf \1 \2/p' konf.lst | bash 
                echo "done!" ;;
            * ) 
                #exprs="s/$cfg:\\([^:]*\\):\\([^:]*\\)/cp -rf \\1 \\2/p"
                echo "Backing-up \`$cfg\` configuration ..."
                [ -f "`sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/\\1/p" konf.lst`" ] || error "[Error] Cannot found local \`$cfg\`, try \`konfig recover\` "
                sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/cp -rf \\1 \\2/p" konf.lst | bash 
                echo "done!" ;;
        esac
    done
}

##
## remove_conf : Remove conf form konfig.
## @usage : remove_conf <files>
##
remove_conf() {
    for cfg in $@
    do
        case $1 in
            "all" )
                echo "Removing all configurations ..."
                cd .. && rm -rf conf
                mkdir conf && cd conf && touch konf.lst
                echo "done!"  ;;
            * )
                echo "Removing \`$cfg\` configuration ..."
                [ -f "`sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/\\2/p" konf.lst`" ] || error "[Error] Cannot found conf: \`$cfg\`. "
                sed -n "s/$cfg:\\([^:]*\\):\\([^:]*\\)/rm -rf \\2/p" konf.lst | bash
                echo "`sed /$cfg.*/d konf.lst`" > konf.lst
                echo "done!" ;;
        esac
    done
}

##
## list_conf : List configurations.
## @usage : list_conf
##
list_conf() {
    awk -F: '{ print $1,"\t\t\t",$2 }' konf.lst
}

##
## Main
##
case $1 in
    "recover" | "rec" ) 
        shift && cd configs
        [ $# -eq 0 ] && cover_conf "all"
        [ $# -gt 0 ] && case $1 in
                "all" ) cover_conf "all" ;;
                * ) cover_conf $@ ;;
            esac
        cd .. ;;
    "insert" | "add" ) 
        shift && cd configs
        [ $# -ne 3 ] && error "[Error] Wrong number of arguments: 3 needed."
        insert_conf $@ && cd .. ;;
    "backup" )  
        shift && cd configs
        [ $# -eq 0 ] && backup_conf "all"
        [ $# -gt 0 ] && case $1 in 
                "all" ) backup_conf "all" ;;
                * ) backup_conf $@ ;;
            esac
        cd .. ;;
    "remove" | "rm" )
        shift && cd configs
        [ $# -lt 1 ] && error "[Error] Wrong number of arguments: must more than 0."
        remove_conf $@ && cd .. ;;
    "clear" | "clr" )
        shift && cd configs 
        remove_conf "all" && cd ..  ;;
    "list" | "ls" ) 
        shift && cd configs 
        list_conf && cd .. ;;
esac
