#!/usr/bin/env bash

# This script will update bower.json of all exercises
# using the master bower.json in etc/bower.json
# 
# To keep the dependencies in sync and aid the Travis build
# please only update the master bower.json

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript/exercises"

bower_master="$xpurescript/etc/bower.json"

for exercise in *; do
  bower=$exercise/bower.json

  if [[ -f $bower ]]; then
    echo Updating $bower

    cp $bower_master $bower
    sed -i -r 's/"name": "purescript-exercise",/"name": "'$exercise'",/' $bower
  fi
done

