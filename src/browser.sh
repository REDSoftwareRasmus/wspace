#!/bin/bash
. $WSPACE/src/ds.sh

TYPE="browser";

load() { 
    echo Load $1
}

add() { 
    if [ $# -eq 2 ]; then
        DSAddLink $TYPE $@;
    else
        echo "Error: Expected 2 arguments, got $#";
    fi
}

remove() { 
    if [ $# -eq 2 ]; then 
        DSRemoveLink $TYPE $@;
        
    else
        echo "Error: Expected 2 arguments, got $#";
    fi
}

listPresets() { 
    local PRESETS=`ls $WSPACE/ds/$TYPE`
    local EXTENSION=".txt"
    echo ""
    echo "$TYPE Presets:"
    for f in $PRESETS
    do
        if test "${f#*$EXTENSION}" != "$f"
        then
            echo "$f" | sed -e "s/$EXTENSION$//"
        fi
    done
    echo ""
}

listLinks() { 
    local PRESET="$WSPACE/ds/$TYPE/$1.txt"
    if [ -f $PRESET ]; then 
        echo ""
        echo "Preset $1:"
        while read line; do
            echo $line; 
        done < $PRESET;
    else
        echo "ERROR: Unrecognized $TYPE preset $1!"
    fi
    echo ""
}



argn=$#
iarg=$@

case $iarg in
    add*) 
        shift; 
        add $@;;
    rm*|remove*) 
        shift;
        remove $@;;
    l*|list*)
        shift;
        test $# -eq 0 && listPresets $@; 
        test $# -eq 1 && listLinks $@; 
        test $# -ge 2 && echo "Error: Expected 0 or 1 arguments, got $#";
        ;;
    * ) 
        if [ $# -eq 1 ]; then 
            load $@;
        else
            echo "Error: Expected 1 argument, got $#";
        fi
esac


