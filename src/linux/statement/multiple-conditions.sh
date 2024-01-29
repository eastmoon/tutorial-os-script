#!/bin/bash
set -e

# Reference :
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
## https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html

# Declare function
function var() {
    VAR_NAME=${1}
    VAR_VALUE=${2}
    export ${VAR_NAME}="${VAR_VALUE}"
    echo "${VAR_NAME} : ${VAR_VALUE}"
}
# Execute script
var SHELL_GIT_BRANCH release

if [ "${SHELL_GIT_BRANCH}" != "main" ] && [ "${SHELL_GIT_BRANCH}" != "release" ];
then
    echo "T"
else
    echo "F"
fi

if [ "${SHELL_GIT_BRANCH}" != "main" ] || [ "${SHELL_GIT_BRANCH}" != "release" ];
then
    echo "T"
else
    echo "F"
fi
