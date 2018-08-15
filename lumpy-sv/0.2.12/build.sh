#!/bin/bash

mkdir -p $PREFIX/bin

export CPPFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export C_INCLUDE_PATH=${PREFIX}/include
export CPLUS_INCLUDE_PATH=${PREFIX}/include

make

cp bin/lumpy $PREFIX/bin/lumpy
cp bin/lumpyexpress $PREFIX/bin/lumpyexpress
cp scripts/extractSplitReads_BwaMem $PREFIX/bin/lumpy_extractSplitReads_BwaMem

mkdir -p $PREFIX/opt/lumpy
cp -R scripts $PREFIX/opt/lumpy/

echo "
LUMPY_HOME=$PREFIX/opt/lumpy/

LUMPY=$PREFIX/bin/lumpy
SAMBLASTER=$PREFIX/bin/samblaster
SAMBAMBA=$PREFIX/bin/sambamba
SAMTOOLS=$PREFIX/bin/samtools
PYTHON=$PREFIX/bin/python

PAIREND_DISTRO=$PREFIX/opt/lumpy/scripts/pairend_distro.py
BAMGROUPREADS=$PREFIX/opt/lumpy/scripts/bamkit/bamgroupreads.py
BAMFILTERRG=$PREFIX/opt/lumpy/scripts/bamkit/bamfilterrg.py
BAMLIBS=$PREFIX/opt/lumpy/scripts/bamkit/bamlibs.py
" >> $PREFIX/bin/lumpyexpress.config
