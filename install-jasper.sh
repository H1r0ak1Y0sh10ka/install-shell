#!/bin/sh

if test ! -s jasper-1.900.1 ; then
    echo "jasper-1.900.1 is not found"
    wget -nc http://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.1.zip
    unzip  jasper-1.900.1.zip
fi

cd jasper-1.900.1
pwd

./configure --prefix=/home0/b/b33454/local/jasper-1.900.1

make &> make.log
make check &> make.check.log
make install

cd ../
pwd

#### jasper-1.900.1 
export JASPERBIN="/home0/b/b33454/local/jasper-1.900.1/bin" 
export JASPERINC="/home0/b/b33454/local/jasper-1.900.1/include" 
export JASPERLIB="/home0/b/b33454/local/jasper-1.900.1/lib"
