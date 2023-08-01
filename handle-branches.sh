#!/bin/bash

for branch in $(git branch --all | grep '^\s*remotes' | egrep --invert-match '(:?HEAD|master|main)$'); do
    git branch --track "${branch##*/}" "$branch"
done
