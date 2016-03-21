#!/bin/bash

cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .
make

mkdir -p $PREFIX/bin
cp bin/* $PREFIX/bin/
