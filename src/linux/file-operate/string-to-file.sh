#!/bin/bash
set -e

# Reference :
## https://linuxhint.com/bash_loop_list_strings/

# Declare function

# Execute script
##
touch tmp
echo 1234, 456, 789 >> tmp
echo 1234, 456, 789 >> tmp
cat tmp
rm tmp
##
touch tmp
echo 1234, 567, 89, / | tee -a tmp
echo 1234, 567, 89, / | tee -a tmp
echo ----
cat tmp
rm tmp
##
touch tmp
echo 1234, 567, 89, / | tee -a tmp
echo 1234, 567, 89, / | tee -a tmp
echo ----
cat tmp
echo ----
touch tmp2
echo a, b, c >> tmp2
cat tmp >> tmp2
cat tmp2
rm tmp
rm tmp2
