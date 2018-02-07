#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=valgrind
version=3.12.0-mpich-3.2
install=/opt/tools
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget --quiet http://valgrind.org/downloads/valgrind-3.12.0.tar.bz2
tar -xvjf valgrind-3.12.0.tar.bz2
mv valgrind-3.12.0 ${soft}-${version}
cd ${soft}-${version}
./configure --prefix=$prefix --with-mpicc=/opt/tools/mpich-3.2/bin/mpicc
make -j4
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## valgrind
set version 3.12.0-mpich-3.2
proc ModulesHelp { } {
puts stderr "This module enables using valgrind debug and profiling tool"
puts stderr "Compiled with MPICH"
}
module-whatis "valgrind tool"

set prefix /opt/tools/valgrind-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
