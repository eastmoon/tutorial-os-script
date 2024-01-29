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
[ -e .tmp ] && rm .tmp
touch .tmp
echo "config https --type=1 --var=2" >> .tmp
echo "config dotnet --var=1" >> .tmp
cat .tmp
echo ---------
var COMMAND "config https --type=1234 --var=2"
for val in ${COMMAND}; do
    if [[ ! ${val} =~ -+[a-zA-Z1-9]* ]];
    then
        [ ! -z ${result} ] && result="${result} ${val}" || result=${val}
    fi
done
echo ${result}
touch .tmp2
while read -r line; do
    [[ ${line} =~ ${result} ]] && echo ${line} || echo ${line} >> .tmp2
done < .tmp
echo ${COMMAND} >> .tmp2
mv .tmp2 .tmp
echo ---------
cat .tmp
