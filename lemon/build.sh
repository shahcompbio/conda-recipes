#!/bin/bash

export CXXFLAGS="-stdlib=libc++ -mmacosx-version-min=10.9"
export LINKFLAGS="-stdlib=libc++ -mmacosx-version-min=10.9"

mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${PREFIX}/lemon
make install

