#! /bin/sh

#
# diskhog
#
# Lists the total recursive size of each of the sub directories. Sorted from largest to smallest.
# Default directory is current working directory.

# Options:
#   -d<dir>  Start from directory <dir> instead of the current directory
#   -n<num>  Only list the top <num> entries
#   -h       Display the help message and exit
#


DIR='.'
NUM='-0'
HELP=0

for ARGUMENT in "$@"
do

    PARAM=`echo $ARGUMENT | cut -c2` 
    VALUE=`echo $ARGUMENT | awk '{print substr($0, 3)}'`

    case "$PARAM" in
            d)              DIR=$VALUE ;;
            n)		    NUM=$VALUE ;;
            h)		    HELP=1 ;;
            *)   
    esac    

done

if [ $HELP -eq 1 ]; then
    echo "diskhog"
    echo "Displays the size of each subdirectory. Sorted from largest to smallest."
    echo "Parameters:"
    echo "  -d<dir>   Start from directory <dir> instead of the current directory"
    echo "  -n<num>   Only list the top <num> entries (Default: List all subdirectories)"
    exit 0
fi

echo "Compiling data ..."
du -h -d 1 $DIR 2>/dev/null | sort -t \t -hrk1 | head -n$NUM

