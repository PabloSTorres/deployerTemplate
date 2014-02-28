#!/bin/sh

GIT_STATUS=`git status --porcelain`

if [ "$GIT_STATUS" == "" ]; then
    echo "nada modificado"
else
    echo "algo se modifico"
fi

exit 0
