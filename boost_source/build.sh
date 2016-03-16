#!/bin/bash

mkdir -p $PREFIX/src/boost
mv boost $PREFIX/src/boost/
mv libs $PREFIX/src/boost/

mkdir $PREFIX/bin

cp $RECIPE_DIR/get_boost_sources $PREFIX/bin/
chmod a+x $PREFIX/bin/get_boost_sources

cp $RECIPE_DIR/get_boost_include $PREFIX/bin/
chmod a+x $PREFIX/bin/get_boost_include
