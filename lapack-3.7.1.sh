#!/bin/bash

soft=lapack
version=3.7.1
install=/opt/libs
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget http://www.netlib.org/lapack/lapack-3.7.1.tgz
tar -xvzf lapack-3.7.1.tgz
cd ${soft}-${version}
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=${prefix} -DCBLAS=ON
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## lapack
set version 3.7.1
proc ModulesHelp { } {
puts stderr "This module enables using lapack"
puts stderr " "
}
module-whatis "lapack"

set prefix /opt/libs/lapack-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/.modulerc
#%Module
if {![info exists nw-done]} {
module-version valgrind/3.12.0 3.12
module-version valgrind/3.12 default
set nw-done 1
}
#EOF#
