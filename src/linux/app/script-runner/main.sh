#!/bin/bash
set -e

# ref : https://jiepeng.me/2020/03/02/linux-here-document-with-cat-and-eof
# ref : https://linuxhint.com/bash-heredoc-tutorial/

# Declare function
function runner() {
    echo-x command : ${1}
    cat ${2} > .tmp
    source .tmp
    rm .tmp
}
function echo-x() {
    echo [`date`] ${@}
}
# Execute script
runner tmp << EOF
echo 1
echo 12
echo 123
echo-x 1234
EOF
