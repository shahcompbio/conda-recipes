#!/bin/bash

mkdir -p $PREFIX/bin

make
cp bin/lumpy $PREFIX/bin/lumpy
cp bin/lumpyexpress $PREFIX/bin/lumpyexpress
cp bin/lumpyexpress.config $PREFIX/bin/lumpyexpress.config
