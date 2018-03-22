#!/bin/bash

USAGE="USAGE: run <mac app> <arguments>\n"

#####
# MAIN CODE
#####

# Check Args
if [ $# -lt 2 ]; then
    echo "Invalid number of arguments"
    echo $USAGE
    exit 2
fi

PROGRAM=$1
ARGS="${@:2}"

# Check Program
if [ "$PROGRAM" == "code" ]; then
    PROGRAM="visual studio code"
fi

open -a "$PROGRAM" $ARGS

exit 0
