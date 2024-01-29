#!/bin/bash
set -e

# Execute script
NUM=0
[ $(ls *.log | wc -l) -gt 0 ] && NUM=$(ls *.log | tail -n 1 | awk '{split( $1, a, "-"); print a[1]}')
touch $(printf "%0*d" 5 `expr ${NUM} + 1` )-`date "+%Y%m%d%H%M%S"`.log
