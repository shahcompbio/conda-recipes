#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include/"
export CFLAGS="-arch x86_64 -O2"
export CXXFLAGS="-arch x86_64 -O2"
export LDFLAGS="-L${PREFIX}/lib/"
export LIBS="-arch x86_64"
export CC="/usr/local/bin/gcc"
export CXX="/usr/local/bin/g++"
export CPP="/usr/local/bin/cpp"
export CXXCPP="/usr/local/bin/cpp"
bash configure --prefix=$PREFIX --disable-shared-libmaus2 --disable-asm \
    --disable-dependency-tracking --enable-compile-testprograms=no
make install
