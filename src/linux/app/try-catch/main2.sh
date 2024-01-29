#!/bin/bash

## Ref : https://stackoverflow.com/questions/22009364
## Ref : https://kknews.cc/zh-tw/code/pgrk8rj.html
## Ref : https://www.redhat.com/sysadmin/linux-shell-redirection-pipelining
## Ref : https://www.gnu.org/software/bash/manual/html_node/Redirections.html
# Import source
source trycatch.sh
# Execute script
try
(
    throwErrors # automaticatly end the try block, if command-result is non-null
    #ignoreErrors # ignore failures of commands until further notice
    source subscript.sh
)  2> ~/tmperr
# directly after closing the subshell you need to connect a group to the catch using ||
catch || {
    # now you can handle
    case $ex_code in
        $AnException)
            echo "AnException was thrown"
        ;;
        *)
            echo "An exception ( $ex_code ) was thrown"
            echo "  Error : $(<~/tmperr)"
        ;;
    esac
}

runner echo || {
    echo "do other thing"
}
