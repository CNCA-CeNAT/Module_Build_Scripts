#!/bin/bash

soft=pear
version=0.9.10
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
cd $src
mkdir -p ${prefix}
tar -xvzf pear-src-0.9.10.tar.gz
cd pear-src-0.9.10
./configure --prefix=${prefix}
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## pear
set version 0.9.10
proc ModulesHelp { } {
puts stderr "This module enables pear"
puts stderr " "
}
module-whatis "pear"

set prefix /opt/bioinf/pear-${version}

prepend-path PATH ${prefix}/bin
prepend-path MANPATH ${prefix}/share/man
#EOF#
