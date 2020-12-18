#!/bin/bash

mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION

R CMD INSTALL --build .

# Install custom scripts for running qc
mkdir -p $PREFIX/bin
cp $RECIPE_DIR/scripts/oncoplot.R $PREFIX/bin

chmod a+x $PREFIX/bin/oncoplot.R

