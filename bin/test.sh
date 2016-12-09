#!/usr/bin/env bash

# TEST

declare -i TEST_RESULT=0
FAILED_EXERCISES=''

for exercise_dir in exercises/**
do
  exercise_src="$exercise_dir/src"
  exercise_examples_src="$exercise_dir/examples/src"

  mv "$exercise_src" "$exercise_src.impl"
  mv "$exercise_examples_src" "$exercise_src"

  echo "-------------------------------------------------------"
  echo "Testing $exercise_dir"

  cd "$exercise_dir"
  bower install
  pulp test

  # capture result from last command (pulp test)
  if [ $? -ne 0 ]; then
      TEST_RESULT=1
      FAILED_EXERCISES+="$exercise_dir\n"
  fi

  # be kind, rewind
  cd -
  mv "$exercise_src" "$exercise_examples_src"
  mv "$exercise_src.impl" "$exercise_src"
done

if [ $TEST_RESULT -ne 0 ]; then
  echo "The following exercises failed"
  printf $FAILED_EXERCISES
  exit $TEST_RESULT
fi
