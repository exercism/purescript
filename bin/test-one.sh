#!/usr/bin/env bash

exercise_dir="$1"
if [[ -z "$exercise_dir" ]]; then
  echo "Usage: $BASH_SOURCE <exercise>"
  exit 1
fi

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript"

cache_dir="$HOME"
if [ -z "$TRAVIS" ]; then
  cache_dir="$xpurescript"
fi
cache_dir="$cache_dir/.exercise_cache"

declare -i TEST_RESULT=0

echo
echo -e "\e[1;34m----- Testing exercise \e[33m$exercise_dir\e[34m -----\e[0;39m"
echo

if [[ ! -f "exercises/$exercise_dir/bower.json" ]]; then
  echo -e "\e[1;31mExercise \e[33m$exercise_dir\e[31m is missing bower.json, failing test\e[0;39m"
  exit 1
fi

cd "exercises/$exercise_dir"

exercise_src=src
exercise_examples_src=examples/src

# Setup Travis cache
for dir in bower_components output; do
  cache="$cache_dir/$dir"

  mkdir -p "$cache"
  ln -f -s "$cache"
done

mv "$exercise_src" "$exercise_src.impl"
mv "$exercise_examples_src" "$exercise_src"

time bower install
time pulp test

# capture result from last command (pulp test)
if [[ $? == 0 ]]; then
  TEST_RESULT=1
fi

# be kind, rewind
mv "$exercise_src" "$exercise_examples_src"
mv "$exercise_src.impl" "$exercise_src"

exit $TEST_RESULT
