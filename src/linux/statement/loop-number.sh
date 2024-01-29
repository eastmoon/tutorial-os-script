#!/bin/bash
set -e

# Reference :
## https://linuxhint.com/bash_loop_list_strings/

# Declare function
# Execute script
for val in {1..10}; do
    echo ${val}
done
