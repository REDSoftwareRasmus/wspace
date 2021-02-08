#!/bin/bash

load() { 
    echo Load $1
}

add() { 
    echo adding $1
}

list() { 
    echo listing...
}

remove() { 
    echo removing $@
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
        load $@;;
esac


