#!/bin/bash
### case 1
COUNTER=0
for OUTPUT in $(seq 5)
do
    let COUNTER++
done
printf "The value of the counter is COUNTER=%d\n" $COUNTER


### case 2
nc_count=0
while [ $( nc -zvv localhost 27017 2>&1 | grep succeed | wc -l ) -eq 0 ] && [ ${nc_count} -lt 5 ]; do
    echo "Connection failure"
    sleep 1;
    let nc_count++
done

echo "nc_count = ${nc_count}"
