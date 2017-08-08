#!/usr/bin/env bash

#
# Building and testing all the exercises on CI takes a long time
# and can cause CI to time out.
# Rather than testing them all we can just test the ones that have
# changed on the current branch against the master branch.
#

XPURESCRIPT=$(dirname "$BASH_SOURCE")
XPURESCRIPT=$(readlink -f "$XPURESCRIPT/..")
cd "$XPURESCRIPT"

declare -i TEST_RESULT=0
FAILED_EXERCISES=''

cd exercises

FILES_CHANGED=$(
  git diff --name-status master..HEAD |
  grep exercises |
  sed 's|.*exercises/\([^/]*\)/.*|\1|' |
  sort |
  uniq
)

for EXERCISE_DIR in $FILES_CHANGED
do
  "$XPURESCRIPT/bin/test-one.sh" "$EXERCISE_DIR"

  if [[ $? == 0 ]]; then
    TEST_RESULT=1
    FAILED_EXERCISES+="$EXERCISE_DIR\n"
  fi
done

echo
if [[ $TEST_RESULT == 0 ]]; then
  echo -e "\e[1;32mAll changed exercises passed\e[0;39m"
else
  echo -e "\e[1;31mThe following exercises failed"

  echo -e "\e[1;33m"
  printf $FAILED_EXERCISES
  echo -e "\e[0;39m"

  exit $TEST_RESULT
fi
