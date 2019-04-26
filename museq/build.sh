#!/bin/bash

# Install custom scripts for running titan
cd ./museq

echo `ls`
echo $PWD
echo `ls ../`

python setup.py install --boost_source=../boost

