#!/usr/bin/env bash

# This script will update spago.dhall and package.dhall of all exercises
# using the master files from the project template (template/).

set -e
set -o pipefail
set -u

base_dir=$(builtin cd "${BASH_SOURCE%/*}/.." || exit; pwd)
exercises_dir="${base_dir}/exercises"
template_dir="${base_dir}/template"

for config in "$exercises_dir"/*/*/spago.dhall; do
    exercise_dir=$(dirname "${config}")
    slug=$(basename "${exercise_dir}")

    echo "Working in ${exercise_dir}..."

    sed -e "s/exercise-template/${slug}/" < "${template_dir}/spago.dhall" > "${exercise_dir}/spago.dhall"
    cp "${template_dir}/packages.dhall" "${exercise_dir}/packages.dhall"
    cp "${template_dir}/.gitignore" "${exercise_dir}/.gitignore"
done
