#!/bin/sh

SITE=$1
ENV=$2

FILE="seo_configuration_$SITE.json"

./download.sh $SITE

git add -A
git diff --cached -- files/$FILE > temporal/diff 
patch -R -o temporal/reverted files/$FILE temporal/diff

DIFF=`diff temporal/reverted swift_files/$FILE`

if [ -n "$DIFF" ] ; then
	echo "You are not updated from swift, download swift file before modify it"
	exit 1
fi

exit 0
