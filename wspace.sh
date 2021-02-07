#!/bin/bash
version='v0.1'

case $1 in
    [version]* ) echo $version;
    [Nn]* ) exit;;
    * ) echo $'Empty command passed.\n';;
esac