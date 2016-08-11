#!/bin/bash

bash -e ./install

mkdir -p $PREFIX/src/theta/
cp -R * $PREFIX/src/theta/

mkdir -p $PREFIX/bin

printf "#!/bin/bash\ncd $PREFIX/src/theta/ && ./bin/RunTHetA \$@\n" > $PREFIX/bin/RunTHetA
chmod a+x $PREFIX/bin/RunTHetA

printf "#!/bin/bash\njava -jar $PREFIX/src/theta/bin/runBICSeqToTHetA.jar \$@\n" > $PREFIX/bin/BICSeqToTHetA
chmod a+x $PREFIX/bin/BICSeqToTHetA
