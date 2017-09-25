#!/usr/bin/env bash

set -x -e

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
conda build -b --croot $MINICONDA_BUILD_FOLDER --prefix-length 20 .conda/
~                                                  
