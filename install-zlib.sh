#!/bin/sh

export VER=1.2.8

# build zlib
if test ! -s zlib-${VER}.tar.gz ; then
    echo "zlib-${VER}.tar.gz is not found"
wget -nc http://zlib.net/zlib-${VER}.tar.gz
fi

tar -zxvf zlib-${VER}.tar.gz
cd zlib-${VER}
pwd

export INSTDIR=/home0/b/b33454/local/zlib-${VER}-intel
export CC=icc
export CXX=icpc
export CFLAGS='-fPIC'
export CXXFLAGS='-fPIC'
export F77=ifort
export FFLAGS='-fPIC'
export CPP='icc -E'
export CXXCPP='icpc -E'
./configure --prefix=${INSTDIR}
make &> make.log
make check &> make.check.log
make install
cd ../
pwd

### ZLIB
export ZLIB="/home0/b/b33454/local/zlib-${VER}-intel"
export LD_LIBRARY_PATH="${ZLIB}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${ZLIB}/include:${INCLUDE}"



