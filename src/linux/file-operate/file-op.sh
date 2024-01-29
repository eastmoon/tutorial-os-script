#!/bin/bash
set -e

# Reference :

# Declare function
function echo-e() {
    echo -e "\033[31m[`date -Iseconds`]\033[0m ${@}"
}

function echo-i() {
    echo -e "\033[32m[`date -Iseconds`]\033[0m ${@}"
}

function echo-w() {
    echo -e "\033[33m[`date -Iseconds`]\033[0m ${@}"
}

function fadd() {
    ADD_STR=${1}
    TARGET_FILE=${2}
    if [ -e ${TARGET_FILE} ];
    then
        if [ $(grep "${ADD_STR}" ${TARGET_FILE} | wc -l) -eq 0 ];
        then
            echo "${ADD_STR}" >> ${TARGET_FILE}
        else
            echo-w "\"${ADD_STR}\" was exist in ${TARGET_FILE}"
        fi
    else
        echo-e "${TARGET_FILE} not exist"
    fi
}

function faddkv() {
    ADD_KEY=${1}
    ADD_VAL=${2}
    TARGET_FILE=${3}
    [ -z ${4} ] && DELIMITER="=" || DELIMITER=${4}
    ADD_STR=${ADD_KEY}${DELIMITER}${ADD_VAL}
    if [ -e ${TARGET_FILE} ];
    then
        if [ $(grep "${ADD_KEY}" ${TARGET_FILE} | wc -l) -eq 0 ];
        then
            echo "${ADD_STR}" >> ${TARGET_FILE}
        else
            if [ $(grep "${ADD_STR}" ${TARGET_FILE} | wc -l) -eq 0 ];
            then
                ORIGINAL_STR=$(grep "${ADD_KEY}" ${TARGET_FILE})
                sed -i "s/${ORIGINAL_STR}/${ADD_STR}/g" ${TARGET_FILE}
            else
                echo-w "\"${ADD_STR}\" was exist in ${TARGET_FILE}"
            fi
        fi
    else
        echo-e "${TARGET_FILE} not exist"
    fi
}

function freplace() {
    ORIGINAL_STR=${1}
    REPLACE_STR=${2}
    TARGET_FILE=${3}
    if [ -e ${TARGET_FILE} ];
    then
        if [ $(grep "${REPLACE_STR}" ${TARGET_FILE} | wc -l) -eq 0 ];
        then
            sed -i "s/${ORIGINAL_STR}/${REPLACE_STR}/g" ${TARGET_FILE}
        else
            echo-w "\"${REPLACE_STR}\" was exist in ${TARGET_FILE}"
        fi
    else
        echo-e "${TARGET_FILE} not exist"
    fi
}

function fempty() {
    TARGET_FILE=${1}
    if [ -e ${TARGET_FILE} ];
    then
        sed -i '$ d' ${TARGET_FILE}
    else
        echo-e "${TARGET_FILE} not exist"
    fi
}
# Execute shell
### case 1
[ -e /tmp/1234 ] && rm /tmp/1234
touch /tmp/1234
echo "----- add Restart"
fadd "Restart=10" /tmp/1234
cat /tmp/1234
echo "----- replace Restart"
freplace "^Restart=.*" "Restart=40" /tmp/1234
cat /tmp/1234

fadd "persistence 1123 445" /tmp/1234
fadd "persistence 1123 445" /tmp/1234
fadd "persistence 1123 445" /tmp/1234x
freplace "persistence" "# persistence" /tmp/1234
freplace "persistence" "# persistence" /tmp/1234
freplace "persistence" "# persistence" /tmp/1234x
fempty /tmp/1234
fempty /tmp/1234x

### case 1 key-value
[ -e /tmp/4567 ] && rm /tmp/4567
touch /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599" /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599" /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599" /tmp/4567 ":"
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599" /tmp/4567 ":"
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599,12345" /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,48210,55598,55599,12345" /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,55599,12345" /tmp/4567
faddkv "net.ipv4.ip_local_reserved_ports" "48200,48201,55599,12345" /tmp/4567

echo "----- case 1"
cat /tmp/1234

echo "----- case 1 : key-value"
cat /tmp/4567

### case 2
[ -e /tmp/include.h ] && rm /tmp/include.h
touch /tmp/include.h

fadd "#define __FD_SETSIZE       1024" /tmp/include.h
freplace "#define\s*__FD_SETSIZE\s*1024" "#define\t__FD_SETSIZE\t655350" /tmp/include.h

echo "----- case 2"
cat /tmp/include.h
