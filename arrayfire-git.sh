#!/bin/bash

soft=arrayfire
version=git
install=/opt/libs
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
git clone https://github.com/arrayfire/arrayfire.git
mv arrayfire ${soft}-${version}
cd ${soft}-${version}
mkdir build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$prefix -DCUDA_TOOLKIT_ROOT_DIR=/opt/tools/cuda-8.0 
make 
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## arrayfire
set version git
proc ModulesHelp { } {
puts stderr "This module enables using Arrayfire"
puts stderr " "
}
module-whatis "Arrayfire"

set prefix /opt/tools/arrayfire-${version}

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
