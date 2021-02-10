#!/bin/bash

DSAddPreset() {
    if [ ! -f $FILE ]; then
        touch $FILE; 
        echo "Added type $1 preset \"$2\".";
    fi
}

DSAddLink() {
    local FILE="$WSPACE/ds/$1/$2.txt";
    local LINK=$3;
    
    DSAddPreset $1 $2 $FILE;

    if grep -Fxq $LINK $FILE 
    then 
        echo "Link \"$LINK\" already in $1 preset \"$2.\""
    else
        echo $LINK >> $FILE;
        echo "Added \"$LINK\" to preset \"$2.\""
    fi
}

DSRemovePreset() {
    
    local FILE="$WSPACE/ds/$1/$2.txt";
    
    if [ ! -f $FILE ]; then 
        echo "Preset $2 does not exist. Create with wspace [-b] add [PRESET] [LINK]."
        return
    fi

    read -p "Remove $1 preset $2? [y/n]: > " yn
    case $yn in
        [Yy]* ) 
            rm $FILE; 
            echo "Removed $1 preset $2."
            ;;
        [Nn]* ) return;;
        * ) echo "Please answer yes [y] or no [n].";;
    esac
}

DSRemoveLink() {
    local FILE="$WSPACE/ds/$1/$2.txt";
    local LINK=$3;

    if [ ! -f $FILE ]; then 
        echo "Preset $2 does not exist. Create with wspace [-b] add [PRESET] [LINK]."
        return
    fi

    if grep -Fxq $LINK $FILE 
    then 
        sed "/$LINK/d" $FILE > tmpfile && mv tmpfile $FILE
        echo "Removed \"$LINK\" from preset \"$2.\""
    else
        echo "Link \"$LINK\" does not exist in $1 preset \"$2.\""
    fi
}