#!/bin/bash

./bootstrap.sh --prefix=${PREFIX}

if [ `uname` == Darwin ]; then
./b2 --prefix=${PREFIX} --build-type=minimal \
    --layout=system toolset=darwin variant=release link=static,shared \
    threading=multi cxxflags="-stdlib=libc++ -mmacosx-version-min=10.7" \
    linkflags="-stdlib=libc++ -mmacosx-version-min=10.7" install
else
./b2 --prefix=${PREFIX} --build-type=minimal \
    --layout=system variant=release link=static,shared \
    threading=multi install
fi
