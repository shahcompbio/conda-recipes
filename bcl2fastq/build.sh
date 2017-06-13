#!/bin/bash

# export CFLAGS="-I${PREFIX}/include/"
# export CPPFLAGS="-I${PREFIX}/include/"
# export LDFLAGS="-L${PREFIX}/lib/"

CC=${PREFIX}/bin/gcc
CXX=${PREFIX}/bin/g++

mkdir build
cd build
../src/configure --prefix=$PREFIX

make
make install
