#!/bin/bash
set -e

# Declare function
function var() {
    VAR_NAME=${1}
    VAR_VALUE=${2}
    export ${VAR_NAME}="${VAR_VALUE}"
    echo "${VAR_NAME} : ${VAR_VALUE}"
}
# Execute script
var DEVOPS_PUBLISH_REPOSITORY RD/website/web-core@feature/demo:1234
echo ---------
echo ${DEVOPS_PUBLISH_REPOSITORY}
repostr=${DEVOPS_PUBLISH_REPOSITORY%@*}
headstr=${DEVOPS_PUBLISH_REPOSITORY#*@}
repo=${repostr##*/}
group=${repostr%/*}
branch=${headstr%:*}
commit=
[[ ${headstr} =~ ":" ]] && commit=${headstr##*:}
echo ${group} ${repo} ${branch} ${commit}
echo ${branch/\//_}
[ ! -z ${commit} ] && echo Have commit-id || echo commit-id not exist
echo ---------
