#!/bin/bash
set -e

# Reference :
## https://linuxhint.com/bash_loop_list_strings/

# Declare function
function var() {
    VAR_NAME=${1}
    VAR_VALUE=${2}
    export ${VAR_NAME}="${VAR_VALUE}"
    echo "${VAR_NAME} : ${VAR_VALUE}"
}
# Execute script
var STRING "123,456,  789"
for val in ${STRING//,/ }; do
    echo ${val}
done
