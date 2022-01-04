#! /bin/sh

#
# diskhog
#
# Lists the total recursive size of each of the sub directories. Sorted from largest to smallest.
# Default directory is current working directory.

# Options:
#   -d<dir>  Start from directory <dir> instead of the current directory
#   -n<num>  Only list the top <num> entries
#


DIR='.'
NUM='-0'

for ARGUMENT in "$@"
do

    PARAM=`echo $ARGUMENT | cut -c2` 
    VALUE=`echo $ARGUMENT | awk '{print substr($0, 3)}'`

    case "$PARAM" in
            d)              DIR=$VALUE ;;
            n)		    NUM=$VALUE ;;
            *)   
    esac    


done

du -h -d 1 $DIR 2>/dev/null | sort -t \t -hrk1 | head -n$NUM

