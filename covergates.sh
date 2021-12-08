#!/bin/sh -l
set -e
report=$1
format=$2
file=$3
comment=$4
event=$(echo $GITHUB_REF | cut -d '/' -f 2)

echo "commit: $GITHUB_SHA ref: $GITHUB_HEAD_REF"

echo "/bin/covergates upload --report $report --type $format $file"
/bin/covergates upload --report $report --type $format $file

if [[ -n $comment ]] && [[ "$event" == "pull" ]]; then
  pr=$(echo $GITHUB_REF | cut -d '/' -f 3)
  /bin/covergates comment --report $report --number $pr
fi
