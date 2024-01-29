#!/bin/bash
set -e

# Declare function
function callfun() {
    echo "[ ${BASH_SOURCE}: line ${LINENO} ] Function in which filename and line"
    echo "[ ${BASH_SOURCE[1]}: ${FUNCNAME[0]}, line ${BASH_LINENO[0]} ] Function called in which filename and line"
}

function calllist() {
    len=${#BASH_SOURCE[@]}
    for (( i=0 ; i<len; i++ ));
    do
        echo "${BASH_SOURCE[${i}]}: ${FUNCNAME[${i}]}, line ${BASH_LINENO[${i}]}"
    done
}
