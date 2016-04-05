#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include/"
export LDFLAGS="-L${PREFIX}/lib/"
export CC="/usr/local/bin/gcc"
export CXX="/usr/local/bin/g++"
export CPP="/usr/local/bin/cpp"
export CXXCPP="/usr/local/bin/cpp"

./configure --prefix=$PREFIX
make
make install
