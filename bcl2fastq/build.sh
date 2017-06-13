#!/bin/bash

CC=${PREFIX}/bin/gcc
CXX=${PREFIX}/bin/g++

mkdir build
cd build
../src/configure --prefix=$PREFIX

make
make install
