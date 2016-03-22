#!/bin/bash

mkdir build

cd src
export CPLUS_INCLUDE_PATH=$PREFIX/include
make "GSL=$PREFIX/lib/libgsl.a $PREFIX/lib/libgslcblas.a" CC=g++ CC_FLAGS="-Wall -ggdb -O3 -fopenmp -DHAVE_INLINE"
cd ..

mkdir -p $PREFIX/bin
cp build/cloneHD $PREFIX/bin
cp build/filterHD $PREFIX/bin
cp build/pre-filter $PREFIX/bin
