#!/bin/bash
set -e

# Declare variable
CACHE=/tmp/cache

# Declare function
function devops-cli() {
    echo ${@}
    [[ "${@}" == "" ]] && echo T || echo F
}
#
devops-cli
devops-cli repo
devops-cli repo \"publish product --publish=${CACHE}\"
