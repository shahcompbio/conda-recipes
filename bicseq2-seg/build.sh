#!/bin/bash

make all MBICseq

mkdir -p $PREFIX/src/bicseq2-seg/
cp -R * $PREFIX/src/bicseq2-seg/

mkdir -p $PREFIX/bin
printf "#!/bin/bash\ncd $PREFIX/src/bicseq2-seg/ && ./NBICseq-seg.pl \$@\n" > $PREFIX/bin/bicseq2-seg
chmod a+x $PREFIX/bin/bicseq2-seg
