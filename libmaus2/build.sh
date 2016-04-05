#!/bin/bash

export CPPFLAGS="-I${PREFIX}/include/"
export CFLAGS="-arch i386 -arch x86_64 -O2"
export CXXFLAGS="-arch i386 -arch x86_64 -O2"
export LDFLAGS="-L${PREFIX}/lib/"
export LIBS="-arch i386 -arch x86_64"
bash configure --prefix=$PREFIX --disable-shared-libmaus2 --disable-asm \
    --disable-dependency-tracking
make install
