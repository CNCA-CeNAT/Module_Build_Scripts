#!/bin/bash

soft=vcftools
version=0.1.15
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
mkdir $prefix
cd $src
tar -xvzf vcftools_0.1.13.tar.gz
cd ${soft}-${soft}-ea875e2
./autogen.sh
./configure --prefix=$prefix
make
make install
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## vcftools
set version 0.1.15
proc ModulesHelp { } {
puts stderr "This module enables VCF Tools"
puts stderr " "
}
module-whatis "VCF Tools"

set prefix /opt/bioinf/vcftools-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path MANPATH ${prefix}/share/man
#EOF#
