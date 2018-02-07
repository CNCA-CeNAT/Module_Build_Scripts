#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=valgrind
version=3.12.0-nompi
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
./configure --prefix=$prefix
make -j4
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## valgrind
set version 3.12.0-nompi
proc ModulesHelp { } {
puts stderr "This module enables using valgrind debug and profiling tool"
puts stderr " "
}
module-whatis "valgrind tool"

set prefix /opt/tools/valgrind-${version}

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
