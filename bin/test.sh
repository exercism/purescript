#!/usr/bin/env bash

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(cd "$xpurescript/.." && pwd -P)
cd "$xpurescript"

# Prepare the work directory

work_dir="$xpurescript/.work"

mkdir -p $work_dir

# Clean up if this is used locally (not on Travis)

if [[ -z "$TRAVIS" ]]; then
  rm $work_dir/bower.json
  rm -f $work_dir/src/*.purs
  rm -f $work_dir/test/*.purs
fi

for dir in src test; do
  mkdir -p $work_dir/$dir
done

# Copy the exercises, tests and common bower.json

cp etc/bower.json $work_dir
cp exercises/*/examples/src/*.purs $work_dir/src

for exercise_full in exercises/*; do
  exercise=$(basename $exercise_full)
  module=$(basename $exercise_full/examples/src/*.purs)

  cp exercises/$exercise/test/Main.purs $work_dir/test/$module
done

# List for troubleshooting purposes

cd $work_dir

for f in bower.json src test; do
  echo
  echo -e "\e[1;32m--- [ $f ]\e[0;39m"
  echo

  ls --color -l $f
done

# Create Test.Main and update exercise test modules

cd $xpurescript

node etc/test-main-maker.js $work_dir/test
node etc/test-module-updater.js $work_dir/test

# Install bower dependencies, build and test

cd $work_dir

time bower install

# CI reports that we can use more cores than we can, so limit
# the number we attempt to use to prevent slowdown on CI.
if [[ -z "$LIMIT_CORES" ]]; then
  time pulp test -j 2
else
  time pulp test
fi

test_result=$?

# Report the results

echo
if [[ $test_result == 0 ]]; then
  echo -e "\e[1;32m[ All tests have passed ]\e[0;39m"
else
  echo -e "\e[1;31m[ Some tests have failed ]\e[0;39m"
fi

exit $test_result
