#!/bin/bash

soft=boost
version=1_65_0-gcc
install=/opt/libs
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
wget --quiet https://dl.bintray.com/boostorg/release/1.65.0/source/boost_1_65_0.tar.gz
tar -xvzf boost_1_65_0.tar.gz
cd boost_1_65_0
CC=gcc CXX=g++ ./bootstrap.sh --prefix=$prefix
./b2 install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## Boost
set version 1_65_0-gcc
proc ModulesHelp { } {
puts stderr "This module enables Boost Library"
puts stderr " "
}
module-whatis "Boost Library"

set prefix /opt/libs/boost-${version}

prepend-path CPATH ${prefix}/include/
prepend-path PATH ${prefix}/bin/
prepend-path LIBRARY_PATH ${prefix}/lib/
prepend-path LD_LIBRARY_PATH ${prefix}/lib/
prepend-path MANPATH ${prefix}/share/man/
#EOF#
