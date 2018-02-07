#!/bin/bash

soft=vcflib
version=1.0.0
install=/opt/bioinf
src=/opt/src
module_path=${install}/modulefiles/${soft}
prefix=${install}/${soft}_${version}
cd $install
git clone --recursive https://github.com/vcflib/vcflib.git ${soft}-${version}
cd ${soft}-${version}
make openmp
mkdir -p ${module_path}

/bin/cat <<"#EOF#" > ${module_path}/${version}
#%Module#####################################################################
## vcflib
set version 1.0.0
proc ModulesHelp { } {
puts stderr "This module enables VCF lib"
puts stderr " "
}
module-whatis "VCF lib"

set prefix /opt/bioinf/vcflib-${version}

prepend-path CPATH ${prefix}/include
prepend-path PATH ${prefix}/bin
prepend-path LIBRARY_PATH ${prefix}/lib
prepend-path LIBRARY_PATH ${prefix}/libVCFH
prepend-path LD_LIBRARY_PATH ${prefix}/lib
prepend-path LD_LIBRARY_PATH ${prefix}/libVCFH
prepend-path MANPATH ${prefix}/share/man
#EOF#
