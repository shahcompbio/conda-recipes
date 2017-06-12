#!/bin/bash

# export CFLAGS="-I${PREFIX}/include/"
# export CPPFLAGS="-I${PREFIX}/include/"
# export LDFLAGS="-L${PREFIX}/lib/"

mkdir build
cd build
./build/src/configure --prefix=$PREFIX

make
make install
