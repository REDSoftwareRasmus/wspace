#!/bin/bash

EXTENSION=".txt"

DSAddPreset() {
    if [ ! -f $FILE ]; then
        touch $FILE; 
        echo "Added type $1 preset \"$2\".";
        echo ""
    fi
}

DSAddLink() {
    local FILE="$WSPACE/ds/$1/$2.txt";
    local LINK=$3;
    
    DSAddPreset $1 $2 $FILE;

    if grep -Fxq $LINK $FILE 
    then 
        echo "Link \"$LINK\" already in $1 preset \"$2.\""
        echo ""
    else
        echo $LINK >> $FILE;
        echo "Added \"$LINK\" to preset \"$2.\""
        echo ""
    fi
}

DSRemovePreset() {
    
    local FILE="$WSPACE/ds/$1/$2.txt";
    
    if [ ! -f $FILE ]; then 
        echo "Preset $2 does not exist. Create with wspace [-b] add [PRESET] [LINK]."
        echo ""
        return
    fi

    read -p "Remove $1 preset $2? [y/n]: > " yn
    case $yn in
        [Yy]* ) 
            rm $FILE; 
            echo "Removed $1 preset $2."
            echo ""
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
        echo ""
        return
    fi

    if grep -Fxq $LINK $FILE 
    then 
        sed "/$LINK/d" $FILE > tmpfile && mv tmpfile $FILE
        echo "Removed \"$LINK\" from preset \"$2.\""
        echo ""
    else
        echo "Link \"$LINK\" does not exist in $1 preset \"$2.\""
        echo ""
    fi
}


listPresets() { 
    local PRESETS=`ls $WSPACE/ds/$1`
    
    if [ -z $PRESETS ]; then 
        echo "There are no presets of type $1."
        echo "Create with wspace [-b] add [PRESET] [LINK]."
        echo ""
        return 
    fi
    
    echo ""
    echo "$1 Presets:"
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
    local PRESET="$WSPACE/ds/$1/$2.txt"
    if [ -f $PRESET ]; then 
        echo "Preset $2:"
        while read LINE; do
            echo $LINE; 
        done < $PRESET;
    else
        echo "ERROR: Unrecognized $1 preset $2!";
        echo ""
    fi
    echo "";
}