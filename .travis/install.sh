#!/usr/bin/env bash

set -x -e

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
conda build --no-test --no-anaconda-upload --python $TRAVIS_PYTHON_VERSION .conda/
