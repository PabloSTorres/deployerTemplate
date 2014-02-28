#!/bin/sh

GIT_STATUS=`git status --porcelain`

if [ "$GIT_STATUS" == "" ]; then
    echo "check git status : OK (nothing to commit)"
else
    echo "check git status : FAIL (there are local changes not commited, execute 'git status')"
    exit 1
fi

GIT_PUSH_STATUS=`git push --porcelain --dry-run origin master 2>&1 | grep "up to date"`

if [ "$GIT_PUSH_STATUS" == "" ]; then
    echo "check git push : FAIL (either you're behind or ahead of origin master, execute 'git push')"
    exit 2
else
    echo "check git push : OK (you're up to date with gitHub repo)"
fi

exit 0

