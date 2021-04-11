#!/bin/bash

SCORE=$(curl https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=$1&strategy=$2 | jq '.lighthouseResult.categories.performance.score')
PERFORMANCE_SCORE=$(printf %.0f $(echo $SCORE*100 | bc))

if [ $PERFORMANCE_SCORE -ge $3 ]; then
	echo "Passed ($PERFORMANCE_SCORE >= $3)"
	exit 0
else
	echo "Failed($PERFORMANCE_SCORE < $3"
	exit 1
fi
