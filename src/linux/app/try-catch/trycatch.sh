#!/bin/bash

export AnException=100
export AnotherException=101

function try()
{
    [[ $- = *e* ]]; SAVED_OPT_E=$?
    set +e
}

function throw()
{
    exit $1
}

function throwWran()
{
    echo "[ ${BASH_SOURCE[1]}: line ${BASH_LINENO[0]} ] Warning code ${1}"
}

function catch()
{
    export ex_code=$?
    (( $SAVED_OPT_E )) && set +e
    return $ex_code
}

function throwErrors()
{
    set -e
}

function ignoreErrors()
{
    set +e
}

function runner()
{
    COMMAND_NAME=${1}
    if [ $(command -v ${COMMAND_NAME} | wc -l) -eq 0 ]
    then
        echo "ERROR: command not find"
        return 0
    fi
    return 1
}
