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
var CLI_DIRECTORY ${PWD}
var CLI_FILE ${BASH_SOURCE}
var CLI_FILENAME ${BASH_SOURCE%.*}
var CLI_FILEEXTENSION ${BASH_SOURCE##*.}
var DIRECTORY_NAME ${PWD##*/}
var STRING1 "localhost/tmp/name/"
var STRING1_PATTERN1 ${STRING1/\//_}
var STRING1_PATTERN2 ${STRING1//\//_}
var STRING1_PATTERN2 ${STRING1/#\//_}
var STRING1_PATTERN2 ${STRING1/%\//_}
var STRING2 "123, 456,  789"
var REMOVE_STRING2_EMPTY ${STRING2//\ /}
var FILE "abc.sql.gz"
var FILENAME ${FILE%.*}
var STRING2 " inactive (running)"
var STRING2_PATTERN1 ${STRING2// /}
var STRING2_PATTERN2 ${STRING2_PATTERN1%\(*}
rex="^active"
[[ ${STRING2_PATTERN1// /} =~ ${rex} ]] && echo T || echo F
var BOM_FILENAME /var/data/git/app-glo-/devops-logs/bom/ar2-00008.bom
var BOM_FILENAME ${BOM_FILENAME##*/}
