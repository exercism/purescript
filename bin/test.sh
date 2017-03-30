#!/usr/bin/env bash

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript"

declare -i TEST_RESULT=0
FAILED_EXERCISES=''

cd exercises

for exercise_dir in *
do
  "$xpurescript/bin/test-one.sh" "$exercise_dir"

  if [[ $? == 0 ]]; then
    TEST_RESULT=1
    FAILED_EXERCISES+="$exercise_dir\n"
  fi
done

echo
if [[ $TEST_RESULT == 0 ]]; then
  echo -e "\e[1;32mAll exercises passed\e[0;39m"
else
  echo -e "\e[1;31mThe following exercises failed"

  echo -e "\e[1;33m"
  printf $FAILED_EXERCISES
  echo -e "\e[0;39m"

  exit $TEST_RESULT
fi
