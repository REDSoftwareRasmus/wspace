#!/bin/bash
. $WSPACE/src/ds.sh

TYPE="browser";

load() { 

    local FILE="$WSPACE/ds/$TYPE/$1.txt"
    if [ ! -f $FILE ]; then
        echo "Error! Could not find preset \"$1\""
        echo ""
        return
    fi

    local LINKS=`cat $FILE`
    if [ -z $LINKS ]; then 
        echo ""
        echo "There are no links in preset $TYPE."
        echo "Create with wspace [-b] add [PRESET] [LINK]."
        echo ""
        return 
    fi
    
    echo $FILE
    echo $LINKS
}

add() { 
    if [ $# -eq 2 ]; then
        DSAddLink $TYPE $@;
    else
        echo "Error: Expected 2 arguments, got $#";
        echo ""
    fi
}

remove() { 
    if [ $# -eq 1 ]; then 
        DSRemovePreset $TYPE $@;
        return 
    fi
    if [ $# -eq 2 ]; then 
        DSRemoveLink $TYPE $@;
        return 
    fi
    echo "Error: Expected 1 or 2 arguments, got $#";
    echo ""
}


argn=$#
iarg=$@

case $iarg in
    add*) 
        shift; 
        add $@;;
    remove*) 
        shift;
        remove $@;;
    list*)
        shift;
        test $# -eq 0 && listPresets $TYPE $@; 
        test $# -eq 1 && listLinks $TYPE $@; 
        test $# -ge 2 && echo "Error: Expected 0 or 1 arguments, got $#";
        ;;
    * ) 
        if [ $# -eq 1 ]; then 
            load $@;
        else
            echo "Error: Expected 1 argument, got $#";
            echo "";
        fi
esac


