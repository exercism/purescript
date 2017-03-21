#!/usr/bin/env bash

# TEST

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript"
echo "xpurescript: $xpurescript"

cache_dir="$HOME"
if [ -z "$TRAVIS" ]; then
  cache_dir="$xpurescript"
fi
cache_dir="$cache_dir/.exercise_cache"
echo "cache_dir: $cache_dir"

declare -i TEST_RESULT=0
FAILED_EXERCISES=''

cd exercises

for exercise_dir in *
do
  echo "-------------------------------------------------------"
  echo "Testing $exercise_dir"

  cd "$exercise_dir"

  exercise_src=src
  exercise_examples_src=examples/src

  # Setup Travis cache
  for dir in bower_components output; do
    cache="$cache_dir/$exercise_dir/$dir"

    mkdir -p "$cache"
    ln -f -s "$cache"
    echo "cache: $(ls -l "$dir")"
  done

  mv "$exercise_src" "$exercise_src.impl"
  mv "$exercise_examples_src" "$exercise_src"

  bower install
  pulp test

  # capture result from last command (pulp test)
  if [ $? -ne 0 ]; then
      TEST_RESULT=1
      FAILED_EXERCISES+="$exercise_dir\n"
  fi

  # be kind, rewind
  mv "$exercise_src" "$exercise_examples_src"
  mv "$exercise_src.impl" "$exercise_src"

  cd -
done

if [ $TEST_RESULT -ne 0 ]; then
  echo "The following exercises failed"
  printf $FAILED_EXERCISES
  exit $TEST_RESULT
fi
