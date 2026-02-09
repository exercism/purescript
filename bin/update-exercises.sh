#!/usr/bin/env bash

# This script will update spago.yaml and .gitignore of all exercises
# using the master files from the project template (template/).

set -e
set -o pipefail
set -u

base_dir=$(builtin cd "${BASH_SOURCE%/*}/.." || exit; pwd)
template_dir="${base_dir}/template"

for exercise_dir in "$base_dir"/exercises/*/*; do
    [ -d "${exercise_dir}" ] || continue
    slug=$(basename "${exercise_dir}")

    echo "Working in ${exercise_dir}..."

    sed -e "s/exercise-template/${slug}/" < "${template_dir}/spago.yaml" > "${exercise_dir}/spago.yaml"
    cp "${template_dir}/.gitignore" "${exercise_dir}/.gitignore"
done
