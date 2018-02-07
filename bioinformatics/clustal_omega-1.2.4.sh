#!/bin/bash


soft=clustal-omega
version=1.2.4
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}-${version}
mkdir -p ${prefix}
cd ${src}
wget http://www.clustal.org/omega/clustal-omega-1.2.4.tar.gz
tar -xvzf clustal-omega-1.2.4.tar.gz
cd clustal-omega-1.2.4
./configure --prefix=${prefix} --with-dmalloc=/opt/libs/dmalloc-5.5.2
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## clustal omega
set version 1.2.4
proc ModulesHelp { } {
puts stderr "This module enables Clustal Omega, compiled with dmalloc"
puts stderr " "
}
module-whatis "Clustal Omega"

set prefix /opt/bioinf/clustal-omega-${version}
prepend-path PATH ${prefix}/bin
prepend-path CPATH ${prefix}/include
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
