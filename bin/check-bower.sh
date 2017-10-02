#!/usr/bin/env bash

# This script will check bower.json of all exercises
# to confirm there are no discrepancies between them
# and the master bower.json in etc/bower.json

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript/exercises"

bower_master="$xpurescript/etc/bower.json"
md5_master=$(md5sum $bower_master | awk '{print $1}')

check_result_all=0

for exercise in *; do
  bower=$exercise/bower.json

  if [[ -f $bower ]]; then
    md5=$(sed -r 's/"name": "'$exercise'",/"name": "purescript-exercise",/' $bower | md5sum | awk '{print $1}')

    check_result=0
    if [[ $md5_master != $md5 ]]; then
      check_result=1
      check_result_all=1
    fi

    if [[ $check_result == 0 ]]; then
      echo -e "\e[1;32mOK     $bower\e[0;39m"
    else
      echo -e "\e[1;31mNOT OK $bower\e[0;39m"
    fi
  fi
done

if [[ $check_result_all != 0 ]]; then
  echo -e "\e[1;31m"
  echo -e "Please check Contributing section in README for more information about fixing the above issues."
  echo -e "\e[0;39m"
fi

exit $check_result_all
