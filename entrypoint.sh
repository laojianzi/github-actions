#!/bin/sh -l

set report=$1
set format=$2
set file=$3
set comment=$4
set event=$(echo $GITHUB_REF | cut -d '/' -f 2)
echo "/bin/covergates upload --report $report --type $format $file"
/bin/covergates upload --report $report --type $format $file

if [[ -n $comment ]] && [[ "$event" == "pull" ]]; then
  set pr=$(echo $GITHUB_REF | cut -d '/' -f 3))
  /bin/covergates comment --report $report --number $pr
fi
