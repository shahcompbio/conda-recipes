#!/bin/bash

export BOOST_ROOT=${PREFIX}/include/
export CPLUS_INCLUDE_PATH=${PREFIX}/lemon/include/
export LIBRARY_PATH=${PREFIX}/lemon/lib/

mkdir build
cd build
cmake -DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 ..
make

mv cliques ${PREFIX}/bin/spruce_cliques
mv enumerate ${PREFIX}/bin/spruce_enumerate
mv merge ${PREFIX}/bin/spruce_merge
mv rank ${PREFIX}/bin/spruce_rank
mv visualize ${PREFIX}/bin/spruce_visualize

