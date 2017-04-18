#!/bin/bash

mkdir -p $PREFIX/share/lichee/release/
mkdir -p $PREFIX/bin/

cp LICHeE/release/lichee.jar $PREFIX/share/lichee/release/lichee.jar

echo "#!/bin/sh" > $PREFIX/bin/lichee
echo "java -jar $PREFIX/share/lichee/release/lichee.jar \"\$@\"" >> $PREFIX/bin/lichee
chmod u+x $PREFIX/bin/lichee

