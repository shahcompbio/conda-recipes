#!/bin/bash

export BOOST_ROOT=${PREFIX}/include/
export CPLUS_INCLUDE_PATH=${PREFIX}/lemon/include/

mkdir build
cd build
cmake ..
make
