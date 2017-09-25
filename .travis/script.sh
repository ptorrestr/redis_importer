#!/usr/bin/env bash

set -e -x

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
conda build -t --python 3.5 .conda/
