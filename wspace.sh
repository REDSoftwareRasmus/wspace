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
        source ./actions/browser.sh $@; 
        return;;
    * ) 
        source ./actions/space.sh $@;;
esac