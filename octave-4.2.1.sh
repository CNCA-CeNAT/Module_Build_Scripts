#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=octave
version=4.2.1
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget --quiet https://ftp.gnu.org/gnu/octave/octave-4.2.1.tar.gz
tar -xvzf ${soft}-${version}.tar.gz
cd ${soft}-${version}
./configure --prefix=/opt/tools/octave-4.2.1 --enable-static --enable-shared --enable-threads --with-hdf5-includedir=/opt/libs/hdf5-1.10.0-patch1 --with-hdf5-libdir=/opt/libs/hdf5-1.10.0-patch1 --with-blas=/opt/libs/blas-3.7.0/lib/libblas.a --with-lapack=/opt/intel/mkl/lib/intel64 
make -j4
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## valgrind
set version 3.12.0-icc
proc ModulesHelp { } {
puts stderr "This module enables using valgrind debug and profiling tool"
puts stderr "Compiled with Intel compiler "
}
module-whatis "valgrind tool"

set prefix /opt/tools/valgrind-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
