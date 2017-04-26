#!/bin/sh

export VER=1.6.1

# build netcdf
if test ! -s parallel-netcdf-${VER} ; then
    echo "parallel-netcdf-${VER} is not found"
    wget -nc http://cucis.ece.northwestern.edu/projects/PnetCDF/Release/parallel-netcdf-${VER}.tar.gz
    tar -zxvf parallel-netcdf-${VER}.tar.gz
fi

cd parallel-netcdf-${VER}
pwd
# --- 

export INSTDIR=/home0/b/b33454/local/parallel-netcdf-${VER}_with_impi-intel


### NetCDF
export NETCDF="/opt/app/netcdf/4.2.0/intel-13.1.3/"
export NCHOME="${NETCDF}"
export NETCDFHOME="${NETCDF}"
export PATH="${NETCDF}/bin:${PATH}"
export LD_LIBRARY_PATH="${NETCDF}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${NETCDF}/include:${INCLUDE}"
export MANPATH="${NETCDF}/man:${MANPATH}"
export MPICH2=/opt/app/intel/impi/5.0.3.048
#export ZLIB=/home/yoshioka/local/zlib-${ZLIBVER}-intel
#export SZIP=/home/yoshioka/local/szip-${SZIPVER}-intel
#export HDF5=/home/yoshioka/local/hdf5-${HDF5VER}_with_szip-intel

export CC=icc
export CXX=icpc
export F77=mpif77
export F90=mpif90
export FC=mpif90
export MPICC=mpicc

export CPP='icc -E'
export CXXCPP='icpc -E'
export CPPFLAGS="-DNDEBUG -Df2cFortran"
#export CPPFLAGS="-DNDEBUG -Df2cFortran -I${ZLIB}/include -I${SZIP}/include -I${HDF5}/include"
#export LDFLAGS="-L${ZLIB}/lib -L${SZIP}/lib -L${HDF5}/lib"
export CFLAGS=-O
export FFLAGS='-O -W'

make clean
./configure  --prefix=${INSTDIR} --with-mpi=${MPICH2}
make &> make.log
make ptest &> make.ptest.log
make install

cd ../
pwd

export PNETCDF=${INSTDIR}

