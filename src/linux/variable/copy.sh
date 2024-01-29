#!/bin/bash
set -e

# Declare variable
export CLASS="123, 456,  8999"
export IS_ON=true
export TEXT=$(cat << EOF
Line1.
Line2.
Line3.
EOF
)
#export DEVOPS_CLASS=
export DEVOPS_CLASS="111, 222"
export DEVOPS_IS_ON=
export DEVOPS_TEXT=
# Execute script
echo "------------------- case 1"
for v in $(env | grep ^DEVOPS)
do
  	vn=${v%=*}
    vn=${vn/DEVOPS_/}
    vv=${v#*=}
    if [ $(env | grep ^${vn} | wc -l) -gt 0 ] && [ -z ${vv} ];
    then
        export ${v%=*}="${!vn}"
    fi
done
env

echo "------------------- case 1.1"
for v in ${DEVOPS_TEXT}
do
    echo ${v}
done

echo "------------------- case 1.2"
category=DEVOPS
for v in $(env | grep ^${category})
do
    #echo ${v}
    vn=${v%=*}
    [[ $(env | grep ^${vn} | wc -l) -gt 0 ]] && echo "${vn}=${!vn}"
done
