#!/bin/bash
set -e

# Import source
source tryfile.sh
# Execute script
FILE_NAME=~/tmp

##
echo "Case 1 -----"
[ -e ${FILE_NAME} ] && rm ${FILE_NAME}
try-file ${FILE_NAME} && {
    echo ${FILE_NAME} exist.
} || {
    echo ${FILE_NAME} not exist.
}
##
echo "Case 2 -----"
[ ! -e ${FILE_NAME} ] && touch ${FILE_NAME}
try-file ${FILE_NAME} && {
    echo ${FILE_NAME} exist.
} || {
    echo ${FILE_NAME} not exist.
}
