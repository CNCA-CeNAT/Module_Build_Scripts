#!/bin/bash

soft=cairo
version=1.15.8
install=/opt/libs
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget https://cairographics.org/snapshots/cairo-1.15.8.tar.xz
tar -xvf cairo-1.15.8.tar.xz
cd ${soft}-${version}
CFLAGS="-std=C90"./configure --prefix=${prefix}
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## cairo
set version 1.15.8
proc ModulesHelp { } {
puts stderr "This module enables using Cairo"
puts stderr " "
}
module-whatis "Cairo"

set prefix /opt/libs/cairo-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
