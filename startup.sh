#!/bin/bash

# Verify if list of files
if [ -n "$FILES" ]
then
    IFS=","
    for v in $FILES
    do
        if [ -n "$DEBUG" ]
        then
            cat "$v" | jq
        else
            cat "$v" | jq -e . > /dev/null 2>&1
        fi
        if [[ $? == 0 ]]
        then
            echo "$v : valid"
        else
            echo "$v : invalid"
            exit 1 
        fi
   done
fi

# Verify if list of dirs
if [ -n "$DIRS" ]
then
    IFS=","
    for d in $DIRS
    do
        cd $d
        for v in *
        do
            if [ -n "$DEBUG" ]
            then
                cat "$d/$v" | jq
            else
                cat "$d/$v" | jq -e . > /dev/null 2>&1
            fi
            if [[ $? == 0 ]]
            then
                echo "$d/$v : valid"
            else
                echo "$d/$v : invalid"
                exit 1 
            fi
        done
   done
fi
