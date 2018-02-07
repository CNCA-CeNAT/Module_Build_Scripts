#!/bin/bash

source /opt/intel/bin/compilervars.sh intel64
source /opt/intel/impi/5.1.3.210/bin64/mpivars.sh intel64

soft=glfw
version=3.1.2
install=/opt/libs
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://github.com/glfw/glfw/archive/3.1.2.zip -O glfw-3.1.2.zip
unzip glfw-3.1.2.zip
cd ${soft}-${version}
mkdir build && cd build
cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${prefix}
make -j8
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## glfw
set version 3.1.2
proc ModulesHelp { } {
puts stderr "This module enables using glfw for graphics processing"
puts stderr "Compiled as part of Arrayfire requisites."
}
module-whatis "glfw libs"

set prefix /opt/libs/glfw-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#

/bin/cat <<"#EOF#" > ${module_path}/.modulerc
#%Module
if {![info exists nw-done]} {
module-version glfw/3.1.2 3.1
module-version glfw/3.1 default
set nw-done 1
}
#EOF#
