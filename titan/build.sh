#!/bin/bash

# R refuses to build packages that mark themselves as
# "Priority: Recommended"
mv DESCRIPTION DESCRIPTION.old
grep -v '^Priority: ' DESCRIPTION.old > DESCRIPTION
#
$R CMD INSTALL --build .
#
# # Add more build steps here, if they are necessary.
#
# See
# http://docs.continuum.io/conda/build.html
# for a list of environment variables that are set during the build
# process.
# 

# Install custom scripts for running titan
mkdir -p $PREFIX/bin
cp $RECIPE_DIR/createTITANsegmentfiles.pl $PREFIX/bin
chmod a+x $PREFIX/bin/createTITANsegmentfiles.pl

cp $RECIPE_DIR/parse_titan_segments.py $PREFIX/bin
chmod a+x $PREFIX/bin/parse_titan_segments.py

cp $RECIPE_DIR/run_titan.R $PREFIX/bin
chmod a+x $PREFIX/bin/run_titan.R
