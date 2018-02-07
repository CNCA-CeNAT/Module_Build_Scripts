#!/bin/bash

soft=sortmerna
version=2.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd ${src}
wget https://github.com/biocore/sortmerna/archive/2.1.tar.gz
tar -xvzf 2.1.tar.gz
cd sortmerna-2.1
./build.sh --prefix=${prefix}
make install
mkdir -p ${module_path}

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
