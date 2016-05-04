#!/bin/bash

mkdir -p $PREFIX/bin

cp variantFiltering/somaticVariants/somaticFilter.py $PREFIX/bin/dellySomaticFilter
chmod a+x $PREFIX/bin/dellySomaticFilter

cd variantFiltering
cp $RECIPE_DIR/setup.py ./
$PYTHON setup.py install
