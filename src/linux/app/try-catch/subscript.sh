#!/bin/bash

# open a subshell !!!
echo "do something"
[ someErrorCondition ] && throwWran $AnException

echo "do something more"
executeCommandThatMightFail

echo "now on to something completely different"
executeCommandThatMightFail

echo "do something 2"
