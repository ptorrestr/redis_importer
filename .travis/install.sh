#!/usr/bin/env bash

set -x -e

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
conda build -b --python 3.5 .conda/
~                                                  
