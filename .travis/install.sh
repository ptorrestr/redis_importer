#!/usr/bin/env bash

set -x -e

export PATH="$HOME/miniconda/bin:$PATH"
conda build --no-test --no-anaconda-upload --croot $MINICONDA_BUILD_FOLDER .conda/
~                                                  
