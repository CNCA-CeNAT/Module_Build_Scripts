#!/bin/bash

soft=samsa
version=2
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
git clone https://github.com/transcript/samsa2.git samsa-2
cd samsa-2
./build.sh --prefix=${prefix}
make install
cd ${soft}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## sortmerna
set version 2.1
proc ModulesHelp { } {
puts stderr "This module enables sortmerna"
puts stderr " "
}
module-whatis "sortmerna"

set prefix /opt/bioinf/sortmerna-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
#EOF#
