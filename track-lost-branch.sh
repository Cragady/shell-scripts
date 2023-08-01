#!/bin/bash

# NOTE: this was a fast and dirty. The naming
# convention will cause the string sorting you
# see in git to display out of order.

# E.g.
# lost-branch-1
# lost-branch-10
# lost-branch-2
# lost-branch-3

linetracker=0

while IFS= read -r line; do
    # echo "${line[0]}"
    stringarray=($line)
    # for i in "${stringarray[@]}"; do
        # echo "$i"
    # done
    if [[ ! -z "${line// }" ]]; then
        # echo "${stringarray[0]}"
        # echo "lost-branch-$((linetracker + 1))"
        # echo "${linetracker}"
        git branch "lost-branch-$((linetracker + 1))" "${stringarray[0]}"
    fi
    ((linetracker++));
done < "$1"        
