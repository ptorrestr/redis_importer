#!/usr/bin/env bash

set -e -x

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
conda build -t --croot $MINICONDA_BUILD_FOLDER .conda/
