#!/bin/sh

export INSTDIR=/home0/b/b33454/local/sshfs-fuse-2.5
export PATH="${INSTDIR}/bin:${PATH}"
export LD_LIBRARY_PATH="${INSTDIR}/lib:${LD_LIBRARY_PATH}"
export INCLUDE="${INSTDIR}/include:${INCLUDE}"
#export MANPATH="${INSTDIR}/man:${MANPATH}"

if test ! -s sshfs-fuse-2.5 ; then
    echo "sshfs-fuse-2.5 is not found"
    wget -nc http://jaist.dl.sourceforge.net/project/fuse/sshfs-fuse/2.5/sshfs-fuse-2.5.tar.gz
    tar -zxvf sshfs-fuse-2.5.tar.gz
fi

cd sshfs-fuse-2.5
pwd

./configure --prefix=${INSTDIR}

make &> make.log
make check &> make.check.log
make install

cd ../
pwd

