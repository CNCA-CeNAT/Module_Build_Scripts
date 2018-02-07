#!/bin/bash


soft=clustalw
version=2.1
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p ${prefix}
cd ${src}
wget http://www.clustal.org/download/current/clustalw-2.1.tar.gz
tar -xvzf clustalw-2.1.tar.gz
cd clustalw-2.1
./configure --prefix=${prefix} --with-mhash
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## clustalw
set version 2.1
proc ModulesHelp { } {
puts stderr "This module enables Clustalw, compiled with mhash"
puts stderr " "
}
module-whatis "Clustalw"

set prefix /opt/bioinf/clustalw-${version}
prepend-path PATH ${prefix}/bin
prepend-path MANPATH ${prefix}/share/man
#EOF#
