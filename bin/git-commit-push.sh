#!/bin/sh

# First argument is path to local Git repository
# Second argument is the git commit message in double quotes

curDir=$PWD

cd $1

git add .

#echo "Enter your commit message : "
#read commitMsg
git commit --message="$2"

git push

cd $curDir
