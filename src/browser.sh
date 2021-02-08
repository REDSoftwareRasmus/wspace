#!/bin/bash
. ./src/ds.sh

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

list() { 
    echo listing...
}

remove() { 
    if [ $# -eq 2 ]; then
        DSRemoveLink $TYPE $@;
    else
        echo "Error: Expected 2 arguments, got $#";
    fi
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
        list;;
    * ) 
        if [ $# -eq 1 ]; then 
            load $@;
        else
            echo "Error: Expected 1 argument, got $#";
        fi
esac


