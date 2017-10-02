#!/usr/bin/env bash

xpurescript=$(dirname "$BASH_SOURCE")
xpurescript=$(readlink -f "$xpurescript/..")
cd "$xpurescript/exercises"

# Calling the script with 'clean' as the first argument
# will cause a fully clean build

clean=no
if [[ "$1" == clean ]]; then
  clean=yes
fi

# Run for all exercises

for exercise in *; do
  if [[ -f $exercise/bower.json ]]; then
    cd $exercise

    echo
    echo -e "\e[1;32m--- [ $exercise ]\e[0;39m"
    echo

    # Clean local caches if clean build was requested
    if [[ $clean == yes ]]; then
      rm -rf bower_components output .pulp-cache
    fi

    # Move the example solution temporarily
    if [[ ! -d src.tmp ]]; then
      mv src src.tmp
      mv examples/src src
    fi

    # Install and test
    bower install
    pulp test

    # Revert to the previous state
    mv src examples/src
    mv src.tmp src

    cd ..
  fi
done
