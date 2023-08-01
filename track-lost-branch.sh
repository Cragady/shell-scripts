#!/bin/bash

# NOTE: this was a fast and dirty. The naming
# convention will cause the string sorting you
# see in git to display out of numerical order.

# The way I used this, and I realize there are better
# ways due to piping and/or xargs, but I didn't want to 
# do that. This was a quick and dirty with little thought
# behind it, and I wanted to keep it that way. That, and
# I wanted to audit the output before running the command.

# git fsck --lost-found
# # exact pathing not used - Just for example purposes
# ls -1 .git/lost-found/commit | xargs -n 1 git log -n 1 --pretty=oneline > ../lost.txt
# # exact pathing not used - Just for example purposes
# ../track-lost-branch.sh ../lost.txt
# # You'll want to run the above from inside a git init'd dir
# # pathing to where the script lives.


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
        # Why do math here instead of incrementing linetracker first?
        # Because I wanted to.
        git branch "lost-branch-$((linetracker + 1))" "${stringarray[0]}"
    fi
    ((linetracker++));
done < "$1"        
