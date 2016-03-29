#!/bin/bash

TEMP_DIR=`pwd`/tmp
echo -e "2\n\n1\n$TEMP_DIR\nY\n\n\n\n" | bash cplex_studio1251.linux-x86-64.bin

mkdir -p $PREFIX/include
cp --recursive $TEMP_DIR/concert/include/ilconcert $PREFIX/include/
cp --recursive $TEMP_DIR/cplex/include/ilcplex $PREFIX/include/

mkdir -p $PREFIX/lib
cp $TEMP_DIR/concert/lib/*/static_pic/lib* $PREFIX/lib/
cp $TEMP_DIR/cplex/lib/*/static_pic/lib* $PREFIX/lib/
