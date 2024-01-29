#!/bin/bash
set -e

## Ref : https://www.gnu.org/software/bash/manual/html_node/Bash-Variables.html
## Ref : https://stackoverflow.com/questions/35006457
## Ref : https://stackoverflow.com/questions/1835943
# Import source
source utils.sh

# Execute script
echo "[ ${BASH_SOURCE}: line ${LINENO} ] Show current filename and line"
callfun
calllist
