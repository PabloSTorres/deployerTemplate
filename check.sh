#!/bin/sh

GIT_STATUS=`git status --porcelain`

if [ "$GIT_STATUS" == "" ]; then
    echo "no hay nada para comitear"
else
    echo "hay cosas modificadas localmente sin comitear , ejecuta un git status"
fi

GIT_PUSH_STATUS=`git push --porcelain --dry-run origin master 2>&1 | grep "up to date"`

if [ "$GIT_PUSH_STATUS" == "" ]; then
    echo "either you're behind or ahead of origin master"
else
    echo "up to date"
fi

exit 0

