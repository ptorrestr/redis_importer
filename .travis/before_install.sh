#!/usr/bin/env bash

set -x -e

if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  os="MacOSX"
else
  os="Linux"
fi

if [[ "$TRAVIS_PYTHON_VERSION" == "2.7" ]]; then
  python_v="2"
else
  python_v="3"
fi

export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH"
hash conda 2> /dev/null || (\
  wget "https://repo.continuum.io/miniconda/Miniconda${python_v}-latest-${os}-x86_64.sh" -O miniconda.sh \
  && bash miniconda.sh -b -p $HOME/miniconda/root \
  && export PATH="$MINICONDA_ROOT_FOLDER/bin:$PATH" \
  && hash -r \
  && conda config --set always_yes yes --set changeps1 no \
  && conda update -q conda \
  && conda info -a \
  && rm miniconda.sh \
  && conda config --add channels conda-forge \
  && conda config --add channels ptorrestr \
  && conda install conda-build anaconda-client \
  && conda -V)
