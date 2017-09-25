#!/usr/bin/env bash

set -x -e

# Only publish when master is build
if [[ "$TRAVIS_BRANCH" == "master" ]]; then
  export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
  file=$(conda build .conda/ --output)
  anaconda -t $ANACONDA_TOKEN upload $file -u $ANACONDA_USER --force
fi
