#!/bin/bash

export BOOST_ROOT=${PREFIX}/include/
export CPLUS_INCLUDE_PATH=${PREFIX}/lemon/include/
export LIBRARY_PATH=${PREFIX}/lemon/lib/

mkdir build
cd build
cmake -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 ..
make
