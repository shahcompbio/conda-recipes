#!/bin/bash

mkdir -p $PREFIX/bin

export INCLUDE_PATH=$PREFIX/include
export C_INCLUDE_PATH=$PREFIX/include
export CPLUS_INCLUDE_PATH=$PREFIX/include
export LIBRARY_PATH=$PREFIX/lib

cp $RECIPE_DIR/Makefile ./
make STATIC=0 PARALLEL=0 -B src/delly
cp src/delly $PREFIX/bin/delly

