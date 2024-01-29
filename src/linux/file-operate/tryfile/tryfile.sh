#!/bin/bash
function try-file() {
    if [ ! -e ${1} ];
    then
        msg="[ ${BASH_SOURCE[1]}: line ${BASH_LINENO[0]} ] ${IOT_SERVICE_FILE} not exist"
        return 1
    fi
    return 0
}
