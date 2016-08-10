#!/bin/bash

make
mkdir -p $PREFIX/src/bicseq2-norm/
cp -R * $PREFIX/src/bicseq2-norm/

mkdir -p $PREFIX/bin
printf "#!/bin/bash\ncd $PREFIX/src/bicseq2-norm/ && ./NBICseq-norm.pl \$@\n" > $PREFIX/bin/bicseq2-norm
chmod a+x $PREFIX/bin/bicseq2-norm
