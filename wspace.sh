#!/bin/bash
version='v0.1'

argn=$#
iarg=$1

case $iarg in
    -v*|--version*) 
        echo $version;
        return;;
    -b*|--browser*) 
        shift;
        source ./src/browser.sh $@; 
        return;;
    * ) 
        source ./src/space.sh $@;;
esac